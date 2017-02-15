# Rename all *.txt to *.text
for f in *.sql; do 
mv -- "$f" "${f%.sql}.q"
done
