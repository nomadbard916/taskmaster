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

Project Specs:

Ruby version: 2.6.0
Rails version: 5.2.2 
Development system: Windows 10  + Ubuntu 16.04 (WSL) 
Editor: Visual Studio Code 
Production server: Heroku

Rails configurations:

- webpacker
- Bootstrap-sass
- DB: PostgreSQL
- template language: erb


---
Next-stage plans:
As I wanted to finish the project as soon as possible, there are some functionalities mentioned in the instruction yet I didn't implement, or that should be done but skipped. If I need to do some improvements to the project or practice more stuff, they should be as below mentioned:

- password encryption
Yes it's very basic for an app with account functionality, and I know the password should be kept secure by using bcrypt or has_secure_password. Let's just skip it to save some time...
- Github PR
I'm alone and no one to review my PR : (
- testing, Rspec with BDD and CI
At least the app works. I know the importance of TDD or BDD to ensure app quality without the haste to check it manually, but let's skip it for now. I promise I'll learn it ASAP when I have the job.
- i18n
Hum... as this app has English only, let's just skip it.
- model callback to ensure there's at least one admin
Hey I've actually done it, without model callback. An admin can see all the account except for "his own", therefore he cannot delete his own account, leaving at least one admin account in the system.


