import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Wrap(
            children: [
              // Container(
              //   width: 100,
              //   child: TextFormField(
              //     initialValue: builder.siblingSeparation.toString(),
              //     decoration: InputDecoration(labelText: "Sibling Separation"),
              //     onChanged: (text) {
              //       builder.siblingSeparation = int.tryParse(text) ?? 100;
              //       this.setState(() {});
              //     },
              //   ),
              // ),
              // Container(
              //   width: 100,
              //   child: TextFormField(
              //     initialValue: builder.levelSeparation.toString(),
              //     decoration: InputDecoration(labelText: "Level Separation"),
              //     onChanged: (text) {
              //       builder.levelSeparation = int.tryParse(text) ?? 100;
              //       this.setState(() {});
              //     },
              //   ),
              // ),
              // Container(
              //   width: 100,
              //   child: TextFormField(
              //     initialValue: builder.subtreeSeparation.toString(),
              //     decoration: InputDecoration(labelText: "Subtree separation"),
              //     onChanged: (text) {
              //       builder.subtreeSeparation = int.tryParse(text) ?? 100;
              //       this.setState(() {});
              //     },
              //   ),
              // ),
              // Container(
              //   width: 100,
              //   child: TextFormField(
              //     initialValue: builder.orientation.toString(),
              //     decoration: InputDecoration(labelText: "Orientation"),
              //     onChanged: (text) {
              //       builder.orientation = int.tryParse(text) ?? 100;
              //       this.setState(() {});
              //     },
              //   ),
              // ),
              RaisedButton(
                onPressed: () {
                  final node12 = Node(circleWidget(r.nextInt(100)));
                  var edge =
                      graph.getNodeAtPosition(r.nextInt(graph.nodeCount()));
                  print(edge);
                  graph.addEdge(edge, node12);
                  setState(() {});
                },
                child: Text("Add"),
              )
            ],
          ),
          Expanded(
            child: InteractiveViewer(
              scaleEnabled: true,
              panEnabled: true,
              onInteractionStart: (val){
                print(val);
              },
              constrained: false,
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.01,
              maxScale: 100.6,
              child: GraphView(
                graph: graph,
                // algorithm: BuchheimWalkerAlgorithm(
                //   builder,
                //   TreeEdgeRenderer(builder),
                // ),
                algorithm: FruchtermanReingoldAlgorithm(
                  // builder,
                  // TreeEdgeRenderer(builder),
                ),
                paint: Paint()
                  ..color = Colors.green
                  ..strokeWidth = 1
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  // I can decide what widget should be shown here based on the id
                  var a = node.key!.value as int;
                  return circleWidget(a);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Random r = Random();

  Widget circleWidget(int a) {
    return Material(
      shape: CircleBorder(),
      color: Colors.red,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          print('clicked $a');
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$a',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }

  final Graph graph = Graph()..isTree = true;
  // BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  FruchtermanReingoldAlgorithm builder = FruchtermanReingoldAlgorithm();
  // SugiyamaConfiguration builder = SugiyamaConfiguration();

  // SugiyamaConfiguration builder = SugiyamaConfiguration();

  @override
  void initState() {
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node8 = Node.Id(7);
    final node7 = Node.Id(8);
    final node9 = Node.Id(9);
    final node10 = Node(circleWidget(
        10)); //using deprecated mechanism of directly placing the widget here
    final node11 = Node(circleWidget(11));
    final node12 = Node(circleWidget(12));

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3, paint: Paint()..color = Colors.red);
    graph.addEdge(node1, node4, paint: Paint()..color = Colors.blue);
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
    graph.addEdge(node6, node8, paint: Paint()..color = Colors.red);
    graph.addEdge(node4, node9);
    graph.addEdge(node4, node10, paint: Paint()..color = Colors.black);
    graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
    graph.addEdge(node11, node12);

    // builder
    //   ..siblingSeparation = (100)
    //   ..levelSeparation = (150)
    //   ..subtreeSeparation = (150)
    //   ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);

    // builder..orientation = (SugiyamaConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
