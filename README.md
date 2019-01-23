# README

Introduction:
A typical task management app with functions like task management, tagging, login, admin and searching. Its main purpose for me is to:
1. Gain more experience for planning and implementing an app from ground up.
2. By finishing the training material in 5xRuby, showing I'm fully prepared to be a junior Rails developer.

The instruction source for this project:
https://github.com/5xRuby/5xtraining/blob/master/backend.md

For the actual site: 
https://taskmaster9527.herokuapp.com/

For wireframe, please see the Figma link below. https://www.figma.com/file/RasskNltaAxbe5bGspWlxEEe/taskmaster-wireframe?node-id=0%3A1

---

Quick Start:
1. Please freely sign up to get your account. Don't use your actual password, I didn't implement password encryption lol. 
2. When you have an account, please click the "+ New Task" at right bottom. 
3. Please fill in task content and other fields. Upon clicking "save", you can see your task appear on index page. You can also "Edit Task" later at will.
4. If you want an eye-catching tag to add additional data to your task, just click "Tagging". You can add as many tags for a task as you wish, they'll be shown just below your task content.
5. Want to sort tasks in order when there's too many? Just use the "Sort by" links at left-upper part.
6. Or if you want to look for a task even faster by searching the content or tags, just use the search bar at right-upper part. The search results contain both the tasks which content includes the keyword, and tasks which has the tag including the keyword. It's fuzzy match.
7. If you want to test admin functionality, the admin credential: admin@gmail.com, 123. Hey remember: with great power, comes great responsibility : )
8. An admin can browse users and their contents. In admin mode, the "+ New Task" switches to "+ New User". This function can be used to generate a new account and even make it admin.
9. If you see an user with improper contents, as admin, you can just delete the content or even delete the user. Please note, admin has less browsing functionalities like sorting or searching, neither the privilege to modify tasks, as the main purpose of admin function is to check if there's improper usage and just remove them, not to manage the tasks meticulously or manipulate the data by user.


---

Project Specs:

---

Definition of "User":
