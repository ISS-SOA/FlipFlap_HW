## FlipFlap HW

### Overview

This homework assignment asks you to create two files (a module and a class) that are needed to pass all tests.

### Installing Assignment Files

#### 1. Setting up Github
If you are new to git, please complete the following:

- [Follow these instructions to setup git](https://help.github.com/articles/set-up-git/) (Only do 'Setting up Git').
- [Follow these directions to create an SSH key and add it to your Github account](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

#### 2. Getting the assignment repository from Github
Now, clone the files needed to start this homework project in a new directory:

    $ git clone git@github.com:ISS-SOA/FlipFlap_HW.git

This will create a directory called `FlipFlap_HW` in your current directory:

*DO NOT FORK THIS REPO* because you will not submit your solution as pull requests! You may, however, fork the repo if you wish to submit pull requests that fix typos, etc.

If you are familiar with git and Github, please create your own personal repo on Github and push to it.  If you are new to git and Github, please read the submission instructions at the end, very carefully.

### Your Assignment

You are given two application files: `tsv_to_yml.rb`, `yml_to_tsv.rb`. DO NOT EDIT THESE FILES. These two command line applications will be able convert between TSV and Yaml data formats using the `FlipFlap` class, once you complete the assignment.

The `FlipFlap` class is in `flip_flap.rb`, which you may modify.
However, to complete `FlipFlap`, you must first create two modules called `TsvBuddy` (in file `tsv_buddy.rb`) and `YamlBuddy` (in file `yaml_buddy.rb`)

#### 1. tsv_buddy.rb

You must fill out two methods in `TsvBuddy`:

**take_tsv**

`def take_tsv(tsv)` : This method should take a String called `tsv` and convert
it into a data structure called `@data`. For example, you may want `@data` to be an Array of Hashes that looks something like this:

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

**to_tsv**

`def to_tsv` : This method should take any data in `@data` and return a String
in TSV format.

Note that modules cannot be made into object instances (i.e., you cannot do
`mymod = TsvBuddy.new`.  So to test this module in the beginning, you can do something like this:

```
  class Tester
    include TsvBuddy
  end

  t = Tester.new.take_tsv(File.read('data/survey.tsv'))
```

That should show you if `take_tsv` is creating the right structure in `@data`, for example. Of course, please run the full tests (described later) as your development progresses.

#### 2. yaml_buddy.rb

This file should contain a module called `YamlBuddy` with two methods:

`def take_yaml(yaml)` : takes a yaml string and converts it into a data structure in `@data`.

`def to_yaml` : converts any data in `@data` into a yaml string.

Feel free to use the 'yaml' library in R to implement both methods.

#### 3. flip_flap.rb

This file's `FlipFlap` class should mix in `TsvBuddy` and `YamlBuddy` modules (using `include`).
Mixing these modules in will give class `FlipFlap` all of `TsvBuddy`'s and `YamlBuddy`'s methods.

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

Also, take a peek into `flip_flap_spec.rb` to see how it works -- you will soon start writing your own specs for your projects!

### Submission

#### Add your work to the repo

This part is for those of you who are new to using git and Github.

Link this your assignment directory with a new Github repository:
- Create a new repository in your Github account using the '+' button (call it `SOA_flip_flap` for example)
- In your new Github repo, click the green 'Clone or download' button and copy the SSH URL of your Github repo (it should look like `git@github.com:username/your_repo.git` -- if you see an HTTP URL, click the 'Use SSH' link in the popup)
- `cd` into your local directory `FlipFlap_HW`
- set your new Github repo as the remote repo:

`$ git remote set-url origin <SSH URL of Github repo>`

Now, add your changed code and push it to Github.

```
$ git add .
$ git commit -m "Solved the homework; all tests pass"
$ git push -u origin master
```

Please submit the HTTP URL of your Github repo (e.g., `https://github.com/<username>/FlipFlap_HW` -- not the SSH URL you used before).

### What Did We Learn?

This assignment shows you the power of mixins in Ruby's object model.
You have created a class (FlipFlap) that can in the future incorporate code to
parse or create any kind of data format (CSV, Excel, etc.).
To keep FlipFlap short and uncomplicated, we can make modules (like TsvBuddy and YamlBuddy) for other formats (CsvBuddy, ExcelBuddy, etc.) and simply mix them into FlipFlap.
Using mixins cleanly separates our code by keeping the parsing logic away from other code needed by applications to handle the data. And we can do this all without inheritance.

Feel free to ask more questions on our Canvas board, and we will of course discuss this in class!
