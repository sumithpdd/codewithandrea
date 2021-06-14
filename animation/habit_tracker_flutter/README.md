# Flutter Habit Tracker App

## Notes
From this point onwards we will build a habit tracking app, which is the main project of this course.

Here's a roadmap:

[] Animated Task Completion Ring

- Custom painters
- Explicit animations with AnimationController & AnimationBuilder
- GestureDetector
- Arranging items inside a GridView
[] Local data persistence with Hive
- Store tasks with their state on local storage
[] State Management with Riverpod
- We'll use Riverpod for State Management and Dependency Injection
[] Interactive page flip
- Diving deeper deeper dive into explicit animations with AnimationController, 3D Matrix transforms and custom interactive transitions using gesture detectors.
[] Slide in/out animations
- How to implement a bottom panel that slides in and out when we click on the settings gear.
- Learn how a single AnimationController can drive the animation of multiple widgets on screen.
- Staggered animations
[] Advanced theming
- Completely customise the color palette
- Implement multiple themes with different colors & variants
- Save theme preferences to local storage
- Animated theme changes with ImplicitlyAnimatedWidget
[] Add and edit tasks
- Additional UI and functionality to add and edit tasks: choose a task name along with a custom icon.

### Additional notes

And project was inspired by the Streaks app, one of the top Health & Fitness app in the App Store.

All the designs for this app can be found here: <https://mobbin.design/apps/streaks>

Each section will include:

- Starter Project
- Technical Planning
- Implementation

Custom app launch icon is included and generated with flutter_launcher_icons <https://pub.dev/packages/flutter_launcher_icons>

Linting is enabled for the project with the inclusion of analysis_options.yaml and all_lint_rules.yaml

Here's a list of all the linting rules supported by Dart: <https://dart-lang.github.io/linter/lints/>.

Also see this:

Getting started: Creating your Flutter project
<https://dash-overflow.net/articles/getting_started/>

The task completion ring is made of:

- a circle
- an icon in the middle
- the text underneath
To build this (including the animation part) we'll need:

- a custom painter
- AnimationController + AnimationBuilder to show the animation programmatically
- a GestureDetector to control the animation

- we can implement a CustomPainter when any of the existing Flutter widgets are not enough for our purposes
- we can do this by extending the CustomPainter class and implementing the paint() and shouldRepaint() methods.
- the paint() method gives us a canvas that we can use to draw shapes, and all the draw methods that are available take a Paint object that we can use to customise the appearance of our shapes
- if we want to draw shapes that are proportional to the size of the parent widget, we can create variables that depend on the size argument
- it's a good idea to make our painters customisable by passing some values as arguments, just like we would do if we were creating custom widgets.
- we can implement the shouldRepaint method is such a way that it only returns true when something changes, and this helps with performance.
