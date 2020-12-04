### Chapter 1

# Problem 1
# Is Unique: A. Implement an algorithm to determine if a string has all unique characters.
# B. What if you cannot use additional data structions?

using Random

Random.seed!(0);
stringsample = randstring(['A':'Z'; '1':'9'],12)
# I want to determine if each of the items in the string sample is unique
# This involves constructing a list of each element and their counts, and determining if the count is > 1

function charcount(string::String)
    chardict = Dict{Char,Integer}()
    for char in string
        println(char)
        if char ∈ keys(chardict)
            chardict[char] += 1
            println("The Following char is repeated: $char")
        else
            chardict[char] = 1
        end
    end
    return chardict
end


chardict = charcount(stringsample)
filter(p->(p[2] >1),chardict)

# B what if you cannot use additional data structures?
# I would have to: For character in my string I would iterate over the remaining characters and test equality.
# If I found a match I would exit the function

# Problem 2:
# Check Permutation: Given two strings, write a method to decide if one is a permutation of the other
# I would define a permutation as follows. The trivial permutation: which is a map of string S to itself.
# The nontrivial permutation. Which has the following properties: it contains the same set of characters with the same quantity of each.
# Using the code above I would first test for equality. Then test for string length equality. Then construct two dicts as above and test their individual char counts.

function permutationTest(string1, string2)
    if length(string1) != length(string2)
        println("Not a Permutation: Unequal string lengths")
        return
    elseif string1 == string2
        println("Not a Permutation: Strings are identical")
        return
    else
        charcount_string1_dict = charcount(string1)
        charcount_string2_dict = charcount(string2)
        for key in keys(charcount_string1_dict)
            if charcount_string1_dict[key] != charcount_string2_dict[key]
                println("Not a Permutation: String counts unequal for key $key")
                return
            else
                println("Strings are permutation: String1 $string1 , String2: $string2")
                return
            end
        end
    end
end 

permutationTest(stringsample,stringsample)
permutationTest(stringsample, stringsample[1:3])
permutedstring = stringsample[1:2:end]*stringsample[2:2:end]
println(permutedstring)
println(stringsample)
permutationTest(stringsample, permutedstring)


# Problem 3
# URLify: write a method to replace all spaces in a string with '%20'.
# You may assume that the sting has sufficent space at the end to hold the additional characters, and that you are given the "true"
# length of the string.

# what is the "true" length of the string?

string2 = "Mr John Smith    "
truelength = 13
stringsub = "%20"

#string() concatenates strings

function subfunc(mystring, subchar,subreplace,truelength)
    returnstring = ""
    for i in 1:truelength
        println(mystring[i])
        if mystring[i] == subchar
            returnstring = string(returnstring,subreplace)
        else
            returnstring = string(returnstring, mystring[i])
        end
        
    end
    return returnstring
end

test = subfunc(string2,' ',stringsub,truelength )

println(test," :" , length(test))
# returns "Mr%20John%20Smith :17"

# Problem 4
# PALINDROME PERMUTATION: Given a string, write a function to check if it is a permutation of a palindrome.


# Some interesting properties of palindromes. They are symmetric about a pivot, which is partition line if the length of the sting is even, or a letter if the length of the string is odd.
# So an odd length string would have an even number of each character except the for one, which would be odd.
# An even length string would have and even number of each character.

function removeWhitespace(string)
    return filter(x -> !isspace(x),string)
end

function palindromePermutationDetector(string)
    string = removeWhitespace(string)
    countdict = charcount(string)
    oddcount = count(i -> isodd(i),values(countdict))
    println("String Length: ",length(string))
    println("Even Count: " ,oddcount)
    println(keys(countdict), length(keys(countdict)))
    if oddcount > 1
        return println("This is NOT a permutation of a palindrome")
        
    else
        return println("This is a permutation of a palindrome")
    end
end

palindromePermutationDetector("atcocta")

#?count()



# PROBLEM 5
# ONE AWAY: there are three types of edits that can be performed on strings: Insert a character
# remove a character, or replace a character. Given two strings, write a function to check if they are only at most one edit away.

# Ok basically I need see if there is a length difference, or if there is a difference in the characters
# Then I can keep a running counter of the edits

# Basically my approach will be to iterate through each of the strings and compare an element deleted version to the other. If the element deleted versions match in length - 1 occurances
# then the two strings are only one edit away.

str_p5 = "this is a test"
str_p5_2 = "this iz a test"
str_p5_3 = "this is a tes"
str_pg_4 = "this is a tesst"
function stringSplice(string1::String, splice_index)
    return (string1[1:splice_index-1],string(string1[splice_index]), string1[splice_index+1:end])
end

function checkinsert(longstr,shortstr)
    insertcounter = 0
    for i in 1:length(longstr)
        #println(join(stringSplice( longstr, i)[[1,3]]), " : ", shortstr)
        #println(join(stringSplice( longstr, i)[[1,3]]) == shortstr)
        if join(stringSplice( longstr, i)[[1,3]]) == shortstr
            insertcounter+=1
        end
    end
    println(insertcounter)
    return insertcounter
end


function checkreplace(longstr, shortstr)
    replacecount = 0
    for i in 1:length(shortstr)
       if join(stringSplice(longstr,i)[[1,3]]) == join(stringSplice(shortstr,i)[[1,3]])
            replacecount += 1
       end
    end
    return replacecount
end


function stringEditCompare(string1::String, string2::String)
    if length(string2) > length(string1)

        stringEditCompare(string2, string1)
    end
    if abs(length(string1) - length(string2)) > 1
        println("There have been more than one 'add' edits")
        prinln("$string1 : $string2")
        return false
    end
    if checkinsert(string1, string2) != 1
        println("There has been more than one 'insert'")
        println("$string1 : $string2")
        return false
    end

    if checkreplace(string1, string2) != 1
        println("There has been more than one 'replace'")
        println("$string1 : $string2")
        
    end

end

TESTLIST = [("pale","ple", true), ("pales","pale", true),("pale", "bale", true), ("pale", "bae", false)]

for row in TESTLIST
    stringEditCompare(row[1],row[2])
end