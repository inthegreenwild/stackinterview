var app = app || {};
var active = active || {};

app.model = Backbone.Model.extend({
	defaults: {
		title: '',
		answer: '',
		rating: 0,
		category: ''
	}
});

app.collection = Backbone.Collection.extend({
	model: app.model,
	url: '/api/v1/questions'
});

app.modelView = Backbone.View.extend({
	initialize:function() {
		
	}
})