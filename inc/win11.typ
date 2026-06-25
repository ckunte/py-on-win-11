== Baseline setup for Windows 11 <s_win>

Set up the foundation layer as follows.#footnote[The steps are to be run in Windows PowerShell terminal --- step-wise copy-paste below at the terminal prompt, and hit Enter key.] The use of the `--system-certs` switch in the steps below is optional, but useful especially if SSL certificate checks break in a corporate environment.#footnote[Due to, say, packet inspection monitoring software deployed.]

+ Install uv:

  ```ps1
  powershell -ExecutionPolicy ByPass -c `
  "irm https://astral.sh | iex"
  ```

+ Install python (say, v3.14):

  ```ps1
  uv --system-certs python install 3.14  
  ```

+ See where it is installed:

  ```ps1
  uv python list
  ```

+ Create one (global) virtual environment:

  ```ps1
  uv venv $HOME\.venvs\global --python 3.14
  ```

+ Activate the virtual environment#footnote[If python installed this way is run in a Terminal, then every new session requires this step to be run.]:

  ```ps1
  & $HOME\.venvs\global\Scripts\Activate.ps1
  ```

+ Install python packages, say, numpy~@numpy, matplotlib~@matplotlib, pandas~@pandas, and scipy~@scipy:

  ```ps1
  uv --system-certs install numpy matplotlib pandas scipy
  ```

+ Verify packages are installed (all below as one line):

  ```ps1
  python -c "import pandas,numpy,scipy,matplotlib; print('OK')"
  ```

+ Check which python the environment uses:

  ```ps1
  python -c "import sys; print(sys.executable)"
  ```

== Setup in apps for Windows 11 <a_win>

=== Thonny

In Thonny~@thonny, all one needs to do is set the location of python executable, like so:

#figure(
  image("thonny.png", width: 93%),
  caption: [Set python executable path in Thonny]
) <path>

The path should be as below, where `%USERNAME%` is the Windows username as shown in the example shown in @path:
```
C:/Users/%USERNAME%/.venvs/global/Scripts/python.exe
```

=== Sublime Text

A custom build file may be setup (only once) in Sublime Text~@subl, whose contents may be as follows. Ensure value of each key is a single line, e.g., a key is `shell_cmd`, and its corresponding value is provided after `:` until `,` at the end, except the last key item of course:

```sublime-build
{   
  "shell_cmd" : "uv run --python C:\\Users\\%USERNAME%\\.venvs\\global\\Scripts\\python.exe \"$file_name\"",
  "selector" : "source.py",
  "path" : "C:\\Users\\%USERNAME%\\.local\\bin;$path",
  "working_dir" : "$file_path"
}
```
With this setup under _Tools #sym.arrow.r Build system #sym.arrow.r New Build System..._, copy-paste the below block (assuming the paths are as installed, good to double-check), and save this file as, say, `Python-uv.sublime-build`. This creates a menu item under _Tools #sym.arrow.r Build system_. Select _Python-uv_ and Build.

=== Notepad++

In Notepad++~@npp, it is suggested to use NppExec Plug-in to create a build file.

+ Install NppExec via _Plugins #sym.arrow.r Plugins Admin #sym.arrow.r NppExec_.

+ Create a script (with the following contents in it) using _Plugins #sym.arrow.r NppExec #sym.arrow.r Execute..._ (ensure each line a single line in the below).

  ```cmd
  cd "$(CURRENT_DIRECTORY)"

  uv run --python "C:\Users\%USERNAME%\.venvs\global\Scripts\python.exe" "$(FULL_CURRENT_PATH)"
  ```
