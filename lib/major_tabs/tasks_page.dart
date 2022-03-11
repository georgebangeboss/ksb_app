import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:ksb_app/minor_tabs/task_card.dart';
import 'package:ksb_app/my_models/job.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  BuiltJob job1 = BuiltJob(
    (b) => b
      ..clientName = "Nandi County Water"
      ..clientLocation = "Nandi"
      ..clientContact = "0711576823"
      ..clientRep = "Okemwa Nchugu"
      ..dateAssigned = "Jan 6,2022"
      ..engineerDept = "Field Support"
      ..dateCompleted = "Jan 8,2022"
      ..jobDescription = "Install new Big pump"
      ..jobID = "ksb27"
      ..jobStatus = "Completed"
      ..managerName = "Paul Musau"
      ..engineerName = "Bernard Orenge"
      ..engineerContact = "0793256651",
  );
  BuiltJob job2 = BuiltJob(
    (b) => b
      ..clientName = "Nyansiongo Tea Factory"
      ..clientLocation = "Kisii"
      ..clientContact = "0711576823"
      ..clientRep = "Dancun Nchugu"
      ..dateAssigned = "Jan 6,2022"
      ..engineerDept = "Field Support"
      ..jobDescription = "Fix a Pump"
      ..jobID = "ksb25"
      ..jobStatus = "On-Going"
      ..managerName = "Paul Musau"
      ..engineerName = "Bernard Orenge"
      ..engineerContact = "0793286651",
  );
  BuiltJob job3 = BuiltJob(
    (b) => b
      ..clientName = "Mombasa Factory"
      ..clientLocation = "Mombasa"
      ..clientContact = "0711576823"
      ..clientRep = "Jane Nchagugu"
      ..dateAssigned = "Jan 2,2022"
      ..engineerDept = "Field Support"
      ..jobDescription = "Service a Pump"
      ..jobID = "ksb29"
      ..jobStatus = "On-Going"
      ..managerName = "Paul Musau"
      ..engineerName = "Bernard Orenge"
      ..engineerContact = "0793286651",
  );
  List allJobs = [];
  @override
  void initState() {
    allJobs.add(job1);
    allJobs.add(job2);
    allJobs.add(job3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TaskCard(builtJob: allJobs[index]);
          },
          itemCount: allJobs.length,
        ),
      ),
    );
  }
}
