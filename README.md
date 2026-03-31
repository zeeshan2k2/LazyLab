<h1>LazyLab</h1>

<p>
LazyLab is a SwiftUI experimentation project focused on understanding how SwiftUI actually works under the hood.
</p>

<h2>Overview</h2>

<p>
This is not a production app. It is a controlled environment built to explore SwiftUI’s rendering system, 
including view creation, diffing, identity, and state-driven updates.
</p>

## Screenshot

<p align="center">
  <img src="https://github.com/zeeshan2k2/LazyLab/blob/main/Screenshots/Screenshot%202026-04-01%20at%203.14.33%E2%80%AFAM.png" width="250" height="500">
</p>

<h2>Focus Areas</h2>

<ul>
  <li>Lazy containers (LazyVStack, LazyHStack, LazyVGrid, LazyHGrid)</li>
  <li>View creation and destruction timing</li>
  <li>State-driven rendering behavior</li>
  <li>View identity and diffing</li>
  <li>Performance implications of lazy vs non-lazy layouts</li>
</ul>

<h2>Approach</h2>

<p>
Each concept is explored through small, isolated experiments using minimal UI and observable behavior 
(e.g., <code>.onAppear</code> logging and dataset scaling).
</p>

<h2>Goal</h2>

<p>
To build a precise mental model of SwiftUI’s rendering pipeline and predict its behavior before running code.
</p>

<h2>Key Principle</h2>

<pre>
UI = f(state)

state change
→ body recomputation
→ new view tree
→ diffing
→ minimal updates
</pre>

<h2>Disclaimer</h2>

<p>
This repository is intended for learning and internal exploration, not for production use or UI design reference.
</p>
