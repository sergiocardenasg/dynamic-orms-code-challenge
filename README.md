# Dynamic ORMs

## Part 1: Conceptual questions
1. What is a dynamic ORM?
2. What is DRY code and how do we use abstraction / dynamic methods to achieve it?

## Part 2: Coding Challenge - Making our ORM more dynamic
* You've been working on building a real estate application for your friend. So far, you've done some domain modeling, mapped out the models and their relationships, and built classes with methods to reflect these relationships. Last week you built a few key methods that comprise an ORM. You notice you have some repeating code across your Listing and Agent models. This week you will be making your ORM more dynamic.
* Note that there is a rake task `console` in your Rakefile. Make use of this to test out your code.
1. Create a new class called `InterActive` that `Listing` and `Agent` will each inherit from.
2. Build a new `initialize` method in `Listing` and `Agent` that takes in a hash as an argument and doesn't require knowing what attributes will be assigned to instance variables beforehand.
3. Build a new, more dynamic `save` method in your `Interactive` class that can be used for both`Listing` and `Agent`.
4. Build a new, more dynamic `all` method in your `Interactive` class that can be used for both `Listing` and `Agent`.
* If the logic inside the methods gets too lengthy, abstract it into smaller methods.
* Keep in mind you might want to configure your database connection to return your query results in something other than an array.