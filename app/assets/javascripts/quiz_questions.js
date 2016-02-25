var app = app || {}; 
var active = active || {};
app.public_key = <%= ENV['PUBLIC_API'] %> 
active.apiEndpoint = '/api/v1/questions'; 
//easy compatability with rails 
 $.ajaxSetup({
    beforeSend: function(xhr){
      xhr.setRequestHeader('X-Api-Key', app.public_key)
    }
  }); 

// *** BLUEPRINTS ***
app.model = Backbone.Model.extend({
	defaults: {
		title: '',
		answer: '',
		rating: 0,
		category: ''
	}
}); 

app.collection = Backbone.Collection.extend({
	model: app.model, //each item in the database is 
									 //instantiated as a new one of these models blueprint
	url: function() {
    return active.apiEndpoint;
  }
}); 

app.modelView = Backbone.View.extend({
	initialize: function() {
		// every model view should have a model
		// this.model
		var tpl = $('#quiz-template').html();
		this.template = _.template(tpl);
		this.render(); 

	},
	render: function() {
		var data = this.model.attributes; 
		app.correctAnswer = this.model.get('answer');
	 	this.$el.prepend(this.template(data)); 

	}
});

app.choiceView = Backbone.View.extend({
	initialize: function() {
		var tpl = $('#quiz-choice-template').html();
		this.template = _.template(tpl);
		this.render();
	},
	render: function() {
		var data = this.model.attributes; 
		this.$el.append(this.template(data)); 
		
	},
	verify: (function(event) {
		
		if (event.currentTarget.innerHTML.trim() == app.correctAnswer) {
			active.collectionView.refresh();
			} else {
				
				event.currentTarget.style.backgroundColor = 'tomato';
			}
		}

)
});

app.collectionView = Backbone.View.extend({ 
	initialize: function() {
		var that = this; 
		//sync catches all CRUD actions
		this.collection.on('sync', function() {
			that.render();
		}); 
		//every collection view should have a collection 
		//retrieve data from API 'all get' route
		this.collection.fetch(); 
		this.reset(); 
	},
	render: function() {
		var collection = this.collection.models;
		var wrong = _.sample(collection, 3); 
		var answer = wrong[Math.floor(Math.random() * 3)]; 
			// no variable declared for memory purposes -- faster 
			new app.modelView({
				el: $('#quiz-list'),
				model: answer 
			}); 
			// loop through possible choices 
			for (choice in wrong) {
				new app.choiceView({
					events: {
						'click li': 'verify'
					},
					el: $('#choicess'),
					attributes : function () {
    			// Return model data
    				return {
      			 id : this.collection.get( 'id' ),
    				};
  				},
					
					model: wrong[choice],
				});
			};
	},

	reset: function() {
		var reset = '<div class="row choices-list"><ul id="choicess"></ul></div>'; 
		this.$el.html(reset); //empty out any content inside el 
	},
	refresh: function() {
		this.reset();
		this.render(); 
	},

});

// *** END BLUEPRINTS ***

$(document).ready(function(event) {
	
	// instantiate collection + collection view

	$('#front-end').on('click', function() {
		console.log('click');
		active.apiEndpoint = '/api/v1/questions/?category=frontend';
		active.collectionView.collection.fetch(); 
		active.collectionView.reset(); 
	});

	$('#back-end').on('click', function() {
		console.log('click');
		active.apiEndpoint = '/api/v1/questions//?category=backend'; 
		active.collectionView.collection.fetch(); 
		active.collectionView.reset(); 
	});

	$('#full-stack').on('click', function() {
		console.log('click');
		active.apiEndpoint = '/api/v1/questions'; 
		active.collectionView.collection.fetch(); 
		active.collectionView.reset(); 
	});

	active.collection = new app.collection(); 
	active.collectionView = new app.collectionView({
		collection: active.collection,
		el: $('#quiz-list')
	});
	
	$('#skip').on('click', function() {
		active.collectionView.refresh(); 
	}); 

});	