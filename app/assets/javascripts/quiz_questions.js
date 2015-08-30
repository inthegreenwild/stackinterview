var app = app || {}; 
var active = active || {};

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
	url: '/api/v1/questions'
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
		this.$el.append(this.template(data)); 
	}
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
		this.$el.html(''); //empty out any content inside el 

	},
	render: function() {
		var collection = this.collection.models; 

		//loop through all models and render
		
			// no variable declared for memory purposes -- faster 
			new app.modelView({
				el: $('#quiz-list'),
				model: _.sample(collection)
			}); 
		
	}
});

// *** END BLUEPRINTS ***

$(document).ready(function(event) {
	
	// instantiate collection + collection view
	active.collection = new app.collection(); 
	active.collectionView = new app.collectionView({
		collection: active.collection,
		el: $('#quiz-list')
	});
	
});	