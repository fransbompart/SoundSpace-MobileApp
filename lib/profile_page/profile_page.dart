import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = "John";
    _lastNameController.text = "Doe";
    _dobController.text = "01/01/1990";
    _genderController.text = "Male";
    _passwordController.text = "********";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    setState(() {
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_photo.png'),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.person),
              title: TextFormField(
                controller: _nameController,
                enabled: _isEditing,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: TextFormField(
                controller: _lastNameController,
                enabled: _isEditing,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: TextFormField(
                controller: _dobController,
                enabled: _isEditing,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: TextFormField(
                controller: _genderController,
                enabled: _isEditing,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: TextFormField(
                controller: _passwordController,
                enabled: _isEditing,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_isEditing) {
                      _saveChanges();
                    } else {
                      _toggleEdit();
                    }
                  },
                  child: Text(_isEditing ? 'Save' : 'Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
