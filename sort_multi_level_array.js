var points = [
	{ title: 'Apple', votes: 1 },
	{ title: 'Milk', votes: 2 },
	{ title: 'Carrot', votes: 3 },
	{ title: 'Banana', votes: 2 }
];

points.sort(function(b,a){return (a['votes'] - b['votes']) || (a['title'] - b['title'])});
console.log(points[0]['title']);
