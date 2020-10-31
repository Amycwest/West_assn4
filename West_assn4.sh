# ./bin/bash

grep Person possible_voters.txt >> headers.txt
grep -v Person possible_voters.txt >> voters.txt

cut -f 2 voters.txt > age

while read file;
 do
 if [ "${file}" -lt 18 ];
 then echo "no";
 else echo "yes";
 fi;
 done < age >> eligibility

paste voters.txt eligibility >> voters_eligibility

echo "Eligible?" > eligible?

paste headers.txt eligible? >> headers_c.txt

cat headers_c.txt > final.txt

cat voters_eligibility >> final.txt

echo -e "\nFirst 10 Lines of Original File:\n"

head possible_voters.txt | column -t

echo -e "\n"

echo -e "First 10 Lines of New File:\n"

head final.txt | column -t

count=$(grep yes final.txt | wc -l)

echo -e "\nThere are $count\t eligible voters!"

rm headers*
rm voters*
rm age
rm eligi*








