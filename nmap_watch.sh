#!/usr/bin/env bash
# nmap_watch.sh
# Run nmap, compare with previous scan, email diff if changed.
# Edit TARGETS below to the host(s)/subnet you want to scan.

set -euo pipefail

# --------- CONFIG ---------
WORKDIR="$HOME/Desktop/nmap_watch"
TARGETS="127.0.0.1"      # <-- CHANGE THIS to your target(s) (IP, range, or subnet)
PORTS="1-2000"                # ports to scan; adjust as needed
NMAP_OPTS="-sS -sV -p $PORTS --open --reason --max-retries 2 --host-timeout 30s"
EMAIL="kumardevashish000@gmail.com"  # <-- CHANGE to your email
KEEP_DAYS=30                  # keep historical scans for X days
# ---------------------------

mkdir -p "$WORKDIR"
TODAY="$(date +%F_%H-%M-%S)"
OUT="$WORKDIR/scan_$TODAY.nmap"
LAST="$WORKDIR/last_scan.nmap"
DIFF="$WORKDIR/diff_$TODAY.txt"

# Run nmap (use sudo for SYN and OS detection if you want; removing sudo uses TCP connect)
echo "[nmap_watch] Running nmap on $TARGETS (ports $PORTS) at $(date)" >> "$WORKDIR/run.log"
# run nmap and save normal output
sudo nmap $NMAP_OPTS $TARGETS -oN "$OUT" 2>>"$WORKDIR/run.log" || true

# If there is no previous scan, copy this as last and exit (no diff)
if [ ! -f "$LAST" ]; then
  cp "$OUT" "$LAST"
  echo "[nmap_watch] No previous scan found — saved current scan as baseline." >> "$WORKDIR/run.log"
  exit 0
fi

# Create a concise normalized version for diffing (strip timestamps that change)
# We keep lines that indicate host/ports/service info to reduce noisy diffs.
grep -E "Nmap scan report for|^[0-9]+/tcp|^OS details|Service Info:" "$OUT" > "${OUT}.norm"
grep -E "Nmap scan report for|^[0-9]+/tcp|^OS details|Service Info:" "$LAST" > "${LAST}.norm"

# Produce a unified diff
diff -u "$LAST.norm" "${OUT}.norm" > "$DIFF" || true

if [ -s "$DIFF" ]; then
  # Something changed — send email with diff and attach raw scans
  SUBJECT="Nmap Watch: CHANGES detected on $(hostname) at $(date +'%F %T')"
  {
    echo "Nmap Watch detected changes on host: $(hostname)"
    echo "Targets: $TARGETS"
    echo
    echo "Diff:"
    cat "$DIFF"
    echo
    echo "Saved scans:"
    echo "Baseline: $LAST"
    echo "New: $OUT"
  } > "$WORKDIR/email_body.txt"

  # Try to send email (uses 'mail' from mailutils)
  if command -v mail >/dev/null 2>&1; then
    mail -s "$SUBJECT" -a "$OUT" -a "$LAST" "$EMAIL" < "$WORKDIR/email_body.txt" 2>>"$WORKDIR/run.log" \
      && echo "[nmap_watch] Email sent to $EMAIL" >> "$WORKDIR/run.log" \
      || echo "[nmap_watch] Email send failed; check mail config" >> "$WORKDIR/run.log"
  else
    echo "[nmap_watch] mail command not found; writing notification to run.log" >> "$WORKDIR/run.log"
  fi

  # rotate baseline: replace LAST with new OUT
  cp "$OUT" "$LAST"
else
  echo "[nmap_watch] No changes detected." >> "$WORKDIR/run.log"
  # Rotate baseline to keep it fresh (optional) — comment out if you prefer sticky baseline
  cp "$OUT" "$LAST"
fi

# Cleanup old scans
find "$WORKDIR" -type f -name "scan_*.nmap" -mtime +$KEEP_DAYS -delete

exit 0
