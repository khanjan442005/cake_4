import 'package:cake_shop_4/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;
  String? _imageUrl; // For network images (Google Drive, direct URL)
  final ImagePicker _picker = ImagePicker();
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    _prefs = await SharedPreferences.getInstance();
    final String? imagePath = _prefs.getString('profile_image_path');
    final String? imageUrl = _prefs.getString('profile_image_url');

    

    if (imagePath != null) {
      setState(() {
        _imageFile = File(imagePath);
      });
    } else if (imageUrl != null) {
      setState(() {
        _imageUrl = imageUrl;
      });
    }
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.pink),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _imageUrl = null; // Clear network URL if local image is picked
      });
      _prefs.setString('profile_image_path', pickedFile.path);
      _prefs.remove('profile_image_url');
      
    }
  }

  void _setNetworkImage(String url) {
    setState(() {
      _imageUrl = url;
      _imageFile = null; // Clear local image if network URL is set
    });
    _prefs.setString('profile_image_url', url);
    _prefs.remove('profile_image_path');
    
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text('Use Google Drive URL'),
                onTap: () {
                  Navigator.pop(context);
                  _showUrlInputDialog('Google Drive Image URL');
                },
              ),
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text('Use Direct URL'),
                onTap: () {
                  Navigator.pop(context);
                  _showUrlInputDialog('Direct Image URL');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showUrlInputDialog(String title) async {
    String? url = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController urlController = TextEditingController();
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: urlController,
            decoration: const InputDecoration(hintText: "Enter image URL"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Set'),
              onPressed: () {
                Navigator.pop(context, urlController.text);
              },
            ),
          ],
        );
      },
    );
    if (url != null && url.isNotEmpty) {
      _setNetworkImage(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: [
          // Profile Header
          Container(
            color: Colors.pink.shade100,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _showImageSourceDialog, // Allow picking image on tap
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : (_imageUrl != null
                            ? NetworkImage(_imageUrl!)
                            : const NetworkImage("https://i.pravatar.cc/300") as ImageProvider),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Khanjan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text("khanjan@example.com",
                    style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // List Items
          _buildListTile(Icons.shopping_bag, "My Orders", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrderPage()),
            );
          }),
          _buildListTile(Icons.location_on, "Saved Addresses", () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Saved Addresses is not implemented yet.')),
            );
          }),
          _buildListTile(Icons.favorite, "Favorite Cakes", () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Favorite Cakes is not implemented yet.')),
            );
          }),
          _buildListTile(Icons.payment, "Payment Methods", () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Payment Methods is not implemented yet.')),
            );
          }),
          _buildListTile(Icons.notifications, "Notification", () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Notification is not implemented yet.')),
            );
          }),
          _buildListTile(Icons.settings, "Settings", () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Settings page is not implemented yet.')),
            );
          }),
          _buildListTile(Icons.help_outline, "Help & Support", () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Help & support is not implemented yet.')),
            );
          }),

          const Divider(),

          // Logout button
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logout tapped')),
              );
            },
          ),
        ],
      ),
    );
  }
}


