# FlipFlap HW

## Overview

This homework assignment asks you to create and edit some files that are needed to pass all tests.

## Installing Assignment Files

### 1. Setting up Github

If you are new to git, please complete the following:

- [Follow these instructions to set up git](https://help.github.com/articles/set-up-git/)
- [Follow these directions to create an SSH key and add it to your Github account](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

### 2. Get and Setup assignment code from Github

*DO NOT FORK THE CLASS REPO* because you will not submit your solution as pull requests!

Clone the files needed to start this homework assignment:

```bash
git clone git@github.com:ISS-SOA/FlipFlap_HW.git
```

This will create a directory called `FlipFlap_HW/` in your current directory.

Specify your local Ruby version using `rbenv local`.

Run `bundle install` to install all gems in Gemfile.

If you are new to git and Github, please read the submission instructions at the end, very carefully. To submit your assignment, you will later create your own personal repository on Github and push to it.

## Test Your Solution

Start by testing your solution after cloning it to make sure that your tests fail. Keep testing continuously as you code.

Run the spec file that is provided:

```bash
bundle exec ruby flip_flap_spec.rb
# (runs all tests using only gems specified in Gemfile)
```

Take a peek into `flip_flap_spec.rb` to see how it works -- you will soon start writing your own specs for your projects!

## Your Assignment

**Files you CANNOT change:**
You are given two application files: `tsv_to_yml.rb`, `yml_to_tsv.rb`. Do NOT edit these files (except to solve rubocop issues with them). These two command line applications will be able convert between TSV and Yaml data formats using the `FlipFlap` class, once you complete the assignment.

**Files you MUST edit:**
The `FlipFlap` class is in `flip_flap.rb`, which you may modify.
However, to complete `FlipFlap`, you must first create two modules called `TsvBuddy` (in `tsv_buddy.rb`) and `YamlBuddy` (in `yaml_buddy.rb`)

### 1. tsv_buddy.rb

You must fill out two methods in `TsvBuddy`:

`def take_tsv(tsv)` : This method should take a String called `tsv` and convert
it into a data structure called `@data`. For example, you may want `@data` to be an Array of Hashes that looks something like this:

```ruby
[{"date"=>"9/12/2014 20:20:55",
  "student_id"=>"3452",
  "languages"=>"Java, C , HTML , JavaScript , ",
  "best_language"=>"Java",
  "app_experience"=>"Native GUI applications, Database Driven Applications",
  "tech_experience"=>
   "Unix-based OS, Database"},

      # <more hashes here>

]
```

`def to_tsv` : This method should use any data in `@data` and return a String
in TSV format.

Note that modules cannot be made into object instances (i.e., you cannot do
`mymod = TsvBuddy.new`.  So to test this module in the beginning, you can do something like this in IRB/Pry:

```ruby
class Tester
  include TsvBuddy
end

t = Tester.new.take_tsv(File.read('data/survey.tsv'))
```

That should show you if `take_tsv` is creating the right structure in `@data`, for example. Of course, please run the full tests (described later) as your development progresses.

### 2. yaml_buddy.rb

This file should contain a module called `YamlBuddy` with two methods:

`def take_yaml(yaml)` : takes a yaml string and converts it into a data structure in `@data`.

`def to_yaml` : converts any data in `@data` into a yaml string.

Feel free to use the `yaml` library in R to easily implement both methods.

### 3. flip_flap.rb

This file's `FlipFlap` class should mix in `TsvBuddy` and `YamlBuddy` modules using the `include` directive.
Including the two modules will give class `FlipFlap` all of `TsvBuddy`'s and `YamlBuddy`'s methods.

And that's it!

## Submission

This part is for those of you who are new to using git and Github.

### 1. Add your work to your local repository

Your working folder already contains a hidden folder called `.git/` where you can save snapshots (commits) of your work to share with others. Once you've finished the assignment, save a snapshot of your final work:

```bash
git add .
git commit -m "All tests pass; rubocop/flog resolved"
```

If you are familiar with git, you might make multiple commits as your work progreses.

### 2. Push your local repository to Github

We will now copy the commit of your final work to a new repository on Github.

Go to the Github website and make sure you are signed in. Then, create a new Github repository:

- Create a new repository in your Github account using the '+' button (call it `SOA_flip_flap` for example)
- In your new Github repo, click the green '(<> Code)' button and copy the SSH URL of your Github repo (it should look something like `git@github.com:username/SOA_flip_flap.git` -- if you see an HTTP URL, click the 'Use SSH' link in the popup)

In your local `FlipFlap_HW/` folder, set your new Github repo as the remote repo where you will be pushing your work:

```bash
git remote set-url origin <SSH URL of Github repo>
```

Now, push your local repo to the Github repo you created.

```bash
git push origin main
```

Please submit the HTTP URL of your Github repo (e.g., `https://github.com/<username>/SOA_flip_flap` -- not the SSH URL you used before).

## What Did We Learn

This assignment shows you the power of mixins in Ruby's object model.
You have created a class (`FlipFlap`) that can in the future incorporate code to
parse or create any kind of data format (such as CSV or XLSX).
To keep FlipFlap short and uncomplicated, we can make modules for other formats (such as `CsvBuddy` or `ExcelBuddy`) and simply mix them into FlipFlap.
Using mixins cleanly separates our code by keeping the parsing logic away from other code needed by applications to handle the data. And we can do this all without inheritance.

Feel free to ask more questions on our Slack workspace, and we will of course discuss this in class!
