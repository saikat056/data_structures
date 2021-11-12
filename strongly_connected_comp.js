arr = [[2,3],[3,1],[1,2],[1,4],[4,5],[7,5],[5,6],[6,7]];
console.log(stronglyConnectedComponents(arr, 7));
function stronglyConnectedComponents(arr, N){
	let graph = createGraph(arr);
	let stack = [];
	let visited = {};
	for(let i = 1; i <= N; i++){
		explore(i, graph, stack, visited);
	}
	visited = {};
	let connectedComp = {};
	let compNum = 0;
	let rGraph = createGraph(reverseArray(arr));
	while(stack.length != 0){
		let v = stack.pop();
		if(!visited[v]){
			findConnected(compNum, connectedComp, v, visited, rGraph);
			compNum++;
		}
	}
	return connectedComp;
}

function findConnected(compNum, connectedComp, vertex, visited, rGraph){
	if(visited[vertex]){
		return;
	}
	visited[vertex] = true;
	if(connectedComp[compNum] == null){
		connectedComp[compNum] = [];
	}
	connectedComp[compNum].push(vertex);
	let neighbours = rGraph[vertex];
	if(neighbours == null){
		return;
	}

	for(let i = 0; i < neighbours.length; i++){
		findConnected(compNum, connectedComp, neighbours[i], visited, rGraph);
	}
}

function explore(vertex, graph, stack, visited){
	if(visited[vertex] == true){
		return;
	}

	visited[vertex] = true;
	let neighbours = graph[vertex];
	if(neighbours == null){
		stack.push(vertex);
		return;
	}

	for(let i = 0; i < neighbours.length; i++){
		explore(neighbours[i], graph, stack, visited);
	}
	stack.push(vertex);
}

function reverseArray(arr){
	let r = [];
	for(let i = 0; i < arr.length; i++){
		let edge = arr[i];
		r.push([edge[1], edge[0]]);
	}
	return r;
}

function createGraph(arr){
	let graph = {};
	for(let i = 0; i < arr.length; i++){
		let edge = arr[i];
		if(graph[edge[0]] == null){
			graph[edge[0]] = [];
		}
		graph[edge[0]].push(edge[1]);
	}
	return graph;
}


