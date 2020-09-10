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

function subfunc(string, subchar,subreplace,truelength)
    returnstring = ""
    for i in 1:truelength
        if string[i] == subchar
            returnstring = string(returnstring,subreplace)
        else
            returnstring = string(returnstring, string[i])
        end
        
    end
    return returnstring
end

println(subfunc(string2,' ',stringsub,truelength ))
