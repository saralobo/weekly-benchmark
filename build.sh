#!/bin/sh
# Rebuilds dist/weekly-benchmark.zip from the skill sources.
# Run after editing SKILL.md, references/ or assets/.
set -e
cd "$(dirname "$0")"
rm -rf dist/weekly-benchmark dist/weekly-benchmark.zip
mkdir -p dist/weekly-benchmark
cp -R SKILL.md references assets dist/weekly-benchmark/
cd dist
zip -qr weekly-benchmark.zip weekly-benchmark -x '*.DS_Store'
rm -rf weekly-benchmark
echo "dist/weekly-benchmark.zip rebuilt"
