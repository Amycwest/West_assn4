# ./bin/bash

#create new files: one with just the headers from possible_voters and one with just the data
grep Person possible_voters.txt >> headers.txt
grep -v Person possible_voters.txt >> voters.txt

#isolate the age column, so a while loop can read through it
cut -f 2 voters.txt > age

#while loop that reads through each age. If the age is less then 18 it echos no; if greater than 18 it echos yes.  Then puts the echoed output into a new file
while read file;
 do
 if [ "${file}" -lt 18 ];
 then echo "no";
 else echo "yes";
 fi;
 done < age >> eligibility

#combines yes and no's from while loop with original data set
paste voters.txt eligibility >> voters_eligibility

#create a new file with just the phrase Eligible?
echo "Eligible?" > eligible

#create new row in the header file
paste headers.txt eligible >> headers_c.txt

#put the combined headers in a new file
cat headers_c.txt > final.txt

#add data to new file
cat voters_eligibility >> final.txt


#output the first 10 lines of the orginal file and the new file and say what each is; make it look nice with column function and escape characters
echo -e "\nFirst 10 Lines of Original File:\n"

head possible_voters.txt | column -t

echo -e "\n"

echo -e "First 10 Lines of New File:\n"

head final.txt | column -t

#count the number of eligible voters and make it a variable
count=$(grep yes final.txt | wc -l)

#echo number of voters
echo -e "\nThere are $count\t eligible voters!"

#remove all the intermitant files so your just left with the orginal file and the final file
rm headers*
rm voters*
rm age
rm eligi*








