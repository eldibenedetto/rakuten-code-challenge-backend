# README

Setup:

This is the Backend to the code challenge you sent me. To seed the databased, cd into the directory and run "rake process" which will unzip the seed file and seed the database.

Scale:

I tried to make the least amount of SQL queries/insertions as possible. I attempted this by using the 'activerecord-import' gem when creating product instances from '/products.csv'. Based on my research, creating an array of product instances and importing in one single SQL insert was more efficient than creating instances during the iteration of each row in the .csv file.

Tests:

I used behavioral testing to test my code.
