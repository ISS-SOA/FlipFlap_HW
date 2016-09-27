## FlipFlap HW

### Overview

This homework assignment asks you to create two files (a module and a class) that
are needed to run the two command lines applications you are given.

### Installing Assignment Files

#### 1. Setting up Github
If you are new to git, please complete the following:

- [Follow these instructions to setup git](https://help.github.com/articles/set-up-git/) (Only do 'Setting up Git').
- [Follow these directions to create an SSH key and add it to your Github account](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

#### 2. Getting the assignment repository from Github
Now, clone the files needed to start this homework project in a new directory:

    $ git clone https://github.com/ISS-SOA/FlipFlap_HW.git

This will create a directory called `FlipFlap_HW` in your current directory.

*DO NOT FORK THIS REPO* because you will not submit your solution as pull requests! You may, however, fork the repo if you wish to submit pull requests that fix typos, etc.

Finally, link this new directory with a new Github repository:
- Create a new repository in your Github account using the '+' button (call it `SOA_flip_flap` for example)
- In your new repo, click the green 'Clone or download' button and copy the SSH URL of your Github repo (it should look like git@github.com:username/your_repo.git)
- `cd` into your local directory `FlipFlap_HW`
- set your new Github repo as the remote repo:

`$ git remote add origin <SSH URL of Github repo>`

If you are new to Github, follow the submission instructions at the end of this README.


### Your Assignment

You are also given two data files to play with: `data/survey.tsv` and `data/survey.yml`

You are given two complete code files: `tsv_to_yml.rb` and `yml_to_tsv.rb`.
These files are command line applications that convert between TSV and Yaml formats.
DO NOT EDIT THESE FILES.
Your task is to get `tsv_to_yml.rb` and `yml_to_tsv.rb` to work, without making any modifications to these files.
Please study their code now.

These two application files need two more code files for the code to work:
`flip_flap.rb` and `tsv_buddy.rb`.

The `flip_flap.rb` file should contain a class called `FlipFlap` that you must create. However, to complete `FlipFlap`, you must first create a complete module called `TsvBuddy` in a file called `tsv_buddy.rb`

#### 1. tsv_buddy.rb

This file already contains an instance variable called `@data`, which will contain a
data structure to hold information loaded from TSV files.
For example, you may want to make this data structure an Array of Hashes that looks something like this:

```
[{"date"=>"9/12/2014 20:20:55",
  "student_id"=>"3452",
  "languages"=>"Java, C , HTML , JavaScript , ",
  "best_language"=>"Java",
  "app_experience"=>"Native GUI applications, Database Driven Applications",
  "tech_experience"=>
   "Unix-based OS, Database"},

      <more hashes here>

]
```

You must fill out two methods in `TsvBuddy`:

`def take_tsv(tsv)` : this method should take a String called `tsv` and convert
it into a data structure to store in `@data`.

`def to_tsv` : this method should take any data in `@data` and return a String
in TSV format.

Note that modules cannot be made into object instances (i.e., you cannot do
`mymod = TsvBuddy.new`.  So to test this module while you are developing it,
you can do something like this:

```
  class Tester
    include TsvBuddy
  end

  t = Tester.new.take_tsv(File.read('data/survey.tsv'))
```

That should show you if `take_tsv` is creating the right structure for example.

#### 2. flip_flap.rb

This class should mixin (using `include`) TsvBuddy. That will give it access to
TsvBuddy's `@data` member variable and to its two methods `take_tsv` and `to_tsv`.

This class should then implement two methods (not provided):

`def take_yaml(yml)` : this method takes a Yaml string and create a data structure to put into `@data`.
You can do this with the `yaml` library.

`def to_yaml` : this method should return `@data` in Yaml format.

And that's it!

### Test Your Solution

Test your solution as you code. You should be able to convert TSV files into Yaml,
and back into TSV with no change in information.

Test your code out by running the spec (test) that is provided:

```
$ bundle install
(only need to run this once; bundle should report success)

$ ruby flip_flap_spec.rb
```

Also, take a peek into `flip_flap_spec.rb` to see how it works -- you will soon start writing your own specs!

### Submission

Please submit the URL of your Github repo.

### What Did We Learn?

This assignment shows you the power of mixins in Ruby's object model.
You have created a class (FlipFlap) that can in the future incorporate code to
parse or create any kind of data format (CSV, Excel, etc.).  To keep FlipFlap short
and uncomplicated, we can make modules (like TsvBuddy) for other formats (CsvBuddy,
ExcelBuddy, etc.) and simply include them into FlipFlap. This cleanly seperates
our code by keeping the logic for parsing (the XyzBuddy modules) away from the code
needed by applications to handle the data (class FlipFlap).

Feel free to ask more questions on our Canvas board, and we will of course discuss
this in class!
