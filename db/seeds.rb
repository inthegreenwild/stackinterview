# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
title answer rating category keyword 
questions_list = [
	[
	  'Explain JavaScript closures', 
		"An inner function that has access to the outer (enclosing) function's variables—scope chain",
		3,
		'frontend',
		'javascript' 
	],

	[
		"How would you compare two objects in JavaScript?",
		"Compare the total number of properties and each of their values."
		3,
		"frontend",
		"javascript"
	],

	[
		"How could you write a method on instance of a date which will give you next day",
		"Declare a method on the prototype of Date object. To get access to the current value of the instance, I will use the 'this' keyword",
		3,
		"frontend",
		"javascript"
	],

	[
		"Explain event bubbling",
		"How events are propagated through elements in the DOM (up or down)",
		3,
		"frontend",
		"javascript"
	],

	[
		"Explain event delegation",
		"The strategy of attatching your event handlers to a parent element rather than on multiple child elements.",
		3,
		"frontend",
		"javascript"
	],

	[
		"Explain what the JavaScript map function does",
		"An array function that executes logic on each element in an array and returns a new array with the modified values",
		3,
		"frontend",
		"javascript"
	],

	[
		"What does float do?",
		"Pushes an element to the sides of a page with text wrapped around it.",
		3,
		"frontend",
		"css"
	],

	[
		"What are the properties related to box model?",
		"Height, width, padding, border, and margin",
		3,
		"frontend",
		"css"
	],

	[
		"How can you get to DevTools in Chrome?",
		"Command Option I or Command Option J on a mac",
		3,
		"frontend",
		"tools"
	],

	[
		"Why are media queries useful?",
		"Allows you to limit stylesheet scope based on media type and screen resolution",
		3,
		"frontend",
		"css"
	],

	[
		"What is the M in MVC?",
		"The model. It is the data and data management of the application",
		3,
		"backend",
		"database"
	],

	[
		"Describe the server response code: 200",
		"OK. Everything is ok",
		3,
		"backend",
		"server"
	],

	[
		"Describe the server response code: 201",
		"Created. A new resource was created at the client's request",
		3,
		"backend",
		"server"
	],

	[
		"Describe the server response code: 500",
		"Internal Server Error. A problem occured on the server side",
		3,
		"backend",
		"server"
	],

	[
		"What is an ORM?",
		"Object-Relational Mapping tools let you query and manipulate data from a database using an object paradigm",
		3,
		"backend",
		"database"
	],

	[
		"What does UNION do in SQL?",
		"Merges the contents of two structurally-compatible tables into a single combined table",
		3,
		"backend",
		"database"
	],

	[
		"What does an INNER JOIN do in SQL?",
		"Combines the rows from two tables and create a result set containing records that are present in both the tables based on joining condition",
		3,
		"backend",
		"database"
	],

	[
	 "What is an AJAX call?",
	 "An asynchronouos request on the client-side to exchange data with a web server without a page transition.",
	 3,
	 "frontend",
	 "javascript"
	]

]