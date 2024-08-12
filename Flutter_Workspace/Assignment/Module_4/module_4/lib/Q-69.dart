
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gmailclone extends StatefulWidget {
  const gmailclone({super.key});

  @override
  State<gmailclone> createState() => _gmailcloneState();
}

class _gmailcloneState extends State<gmailclone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Gmail Clone",style: TextStyle(color: Colors.black),),backgroundColor: Colors.blue,),
      drawer: Drawer
        (
        child: ListView
          (
          children:
          [
            DrawerHeader
              (
              child: Text("Gmail",style: TextStyle(color: Colors.black,fontSize: 25),
              ),
            ),
            ListTile
              (
              leading: Icon(Icons.star),
              title: Text("Starred"),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>_starredpage()));
              }
            ),
            ListTile
              (
              leading: Icon(Icons.watch_later),
              title: Text("Snoozed"),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>_snoozedpage()));
                }
            ),
            ListTile
              (
              leading: Icon(Icons.send_rounded),
              title: Text("Sent"),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>_sentpage()));
                }
            ),
            ListTile
              (
              leading: Icon(Icons.send_and_archive_sharp),
              title: Text("Scheduled"),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>_scheduledpage()));
                }
            ),
            ListTile
              (
              leading: Icon(Icons.outbox),
              title: Text("Outbox"),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>_outboxpage()));
                }
            ),
            ListTile
              (
              leading: Icon(Icons.drafts),
              title: Text("Drafts"),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>_draftspage()));
                }
            ),
            ListTile
              (
              leading: Icon(Icons.mail_outline_rounded),
              title: Text("All mail"),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>_mailpage()));
                }
            ),
            ListTile
              (
              leading: Icon(Icons.security_update_warning),
              title: Text("Spam"),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>_spampage()));
                }
            ),
            ListTile
              (
              leading: Icon(Icons.delete),
              title: Text("Delete"),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>_deletepage()));
                }
            ),
          ],
        ),
      ),
    );
  }
}
class _starredpage extends StatefulWidget {
  const _starredpage({super.key});

  @override
  State<_starredpage> createState() => _starredpageState();
}

class _starredpageState extends State<_starredpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Starred Page"),),
      body: Center(
        child: Text("Nothing in Starred"),
      ),
    );
  }
}

class _snoozedpage extends StatefulWidget {
  const _snoozedpage({super.key});

  @override
  State<_snoozedpage> createState() => _snoozedpageState();
}

class _snoozedpageState extends State<_snoozedpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (appBar: AppBar(title: Text("Snoozed Page"),),
    body: Center
      (
      child: Text("Nothing in Snoozed"),
    ),);
  }
}
class _sentpage extends StatefulWidget {
  const _sentpage({super.key});

  @override
  State<_sentpage> createState() => _sentpageState();
}

class _sentpageState extends State<_sentpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sent Page"),),
      body: Center(
        child: ListView(
          children:
          [
            ListTile
              (
              leading: Image.asset("assets/email.png",height: 20,width: 20,),
              title: Text("To : Saurashtra University",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Row(
                children: [
                  Text("This is email about about .."),
                  SizedBox(width: 40),
                  Text("4 May ")
                ],
              ),
            ),
            ListTile
              (
              leading: Image.asset("assets/email.png",height: 20,width: 20,),
              title: Text("To : patelrm101",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Row(
                children: [
                  Text("This is documnet of the our .."),
                  SizedBox(width: 40),
                  Text("15 Jun")
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

class _scheduledpage extends StatefulWidget {
  const _scheduledpage({super.key});

  @override
  State<_scheduledpage> createState() => _scheduledpageState();
}

class _scheduledpageState extends State<_scheduledpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scheduled Page"),),
      body: Center(
        child: Text("Nothing to Scheduled"),
      ),

    );
  }
}
class _outboxpage extends StatefulWidget {
  const _outboxpage({super.key});

  @override
  State<_outboxpage> createState() => _outboxpageState();
}

class _outboxpageState extends State<_outboxpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OutBox Page"),),
      body: Center(
        child: Text("Nothing to Outbox"),
      ),

    );
  }
}


class _draftspage extends StatefulWidget {
  const _draftspage({super.key});

  @override
  State<_draftspage> createState() => _draftspageState();
}

class _draftspageState extends State<_draftspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Draft Page"),),
      body: Center(
          child: ListView(
            children:
            [
              ListTile
                (
                leading: Image.asset("assets/email.png",height: 20,width: 20,),
                title: Text("Draft",style: TextStyle(color: Colors.red),),
                subtitle: Row(
                  children: [
                    Text("Inquiry Regrading Admission .."),
                    SizedBox(width: 30),
                    Text("26 Jan ")
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}

class _mailpage extends StatefulWidget {
  const _mailpage({super.key});

  @override
  State<_mailpage> createState() => _mailpageState();
}

class _mailpageState extends State<_mailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Mail Page"),),
      body: Center(
        child: ListView(
            children:
            [
            ListTile(
              leading: Image.asset("assets/email.png",height: 20,width: 20,),
              title: Text("Medium Daily Digset",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Row
                  (
                    children:
                      [
                         Text("Let's have our self-hosted .."),
                          SizedBox(width: 40,),
                          Text("25 May")
                      ],
                    ),
              ),
      ListTile(
        leading: Image.asset("assets/email.png",height: 20,width: 20,),
        title: Text("Linkedin",style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Row
          (
          children:
          [
            Text("Let's have our self-hosted..."),
            SizedBox(width: 40,),
            Text("16 May")
          ],
        ),
      ),
      ListTile(
        leading: Image.asset("assets/email.png",height: 20,width: 20,),
        title: Text("Start Daily",style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Row
          (
          children:
          [
            Text("Let's have our self-hosted  ..."),
            SizedBox(width: 40,),
            Text("30 Feb")
          ],
        ),
      ),
        ]
      ),

    )
    );
  }
}

class _spampage extends StatefulWidget {
  const _spampage({super.key});

  @override
  State<_spampage> createState() => _spampageState();
}

class _spampageState extends State<_spampage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Spam Page"),),
      body: Center(
        child: Text("Nothing in Spam"),
      ),
    );
  }
}

class _deletepage extends StatefulWidget {
  const _deletepage({super.key});

  @override
  State<_deletepage> createState() => _deletepageState();
}

class _deletepageState extends State<_deletepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delete Page"),),
      body: Center(
          child: ListView(
            children:
            [
              ListTile
                (
                leading: Image.asset("assets/email.png",height: 20,width: 20,),
                title: Text("Inquiry About University",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Row(
                  children: [
                    Text("Inquiry Regrading Admission .."),
                    SizedBox(width: 30,),
                    Text("26 Jan ")
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}


