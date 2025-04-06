# ♻️ EcoAdvisor – Smart Recycling Assistant App

**EcoAdvisor** is a smart recycling assistant mobile app that helps users recycle, upcycle, and connect with local recycling centers. The app supports guests, regular users, moderators, and admins, each with special access and functions.

## 🌟 Features

- 🔍 **Guest Access**: View nearby recycling centers without logging in.
- 👤 **User Dashboard**: Manage items, view DIY tutorials, and access personalized recommendations.
- 🛠️ **DIY Tutorials**: Generate and view creative ways to reuse or recycle items.
- 📸 **Camera Integration**: Capture images of items to analyze material type.
- 📦 **Item Management**: Add, view, and determine the condition and quantity of items.
- 🗺️ **Recycling Centers**: View locations, contact details, and opening hours.
- 🧠 **AI Tools**: Material recognition and suggestion engine using image analysis.
- 🔐 **Account & Security Settings**: Manage passwords, authentication, and permissions.
- 👨‍💼 **Moderator Tools**: Review items, ban/unban users, and manage complaints.
- 🛎️ **Support System**: Create support tickets and track responses.

## 👤 User Roles

1. **Guest**  
   - View recycling centers only.

2. **HomeRecycler (User)**  
   - Upload items, access tutorials, and track recycling activities.

3. **Moderator**  
   - Review items, manage users, and resolve community issues.

4. **Admin**  
   - Manage system-wide settings, permissions, and user data.

## 🛠️ Technologies Used

- Flutter (Frontend)
- Firebase / Any backend for authentication & data storage
- Machine Learning models for material detection
- Figma (for UI design)

## ⚙️ Class Diagram Overview

Your app follows an object-oriented design with key classes like:

- `HomeRecycler`, `Moderator`, `Admin`, `Guest`
- `Item`, `Camera`, `ImageAnalyzer`, `DIYTutorial`, `RecyclingCenter`
- `Login`, `Dashboard`, `Support`, `Settings`

## 📌 Special Usage Considerations

1. Users must log in to access core features like uploading items and tutorials.  
2. Guests can only view recycling center information.  
3. Moderators must verify content before it becomes public.  
4. Camera access is required to analyze item materials.  
5. Admins have full control and access to all user data and system configurations.

## 🚀 Getting Started

1. Clone the repository  
   ```bash
   git clone https://github.com/yourusername/ecohelper.git
