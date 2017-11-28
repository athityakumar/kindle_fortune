# Contribution guidelines

First of all, thanks for thinking of contributing to this project. :smile:

Before sending a Pull Request, please make sure that you're assigned the task on a GitHub issue.

- If a relevant issue already exists, discuss on the issue and get it assigned to yourself on GitHub.
- If no relevant issue exists, open a new issue and get it assigned to yourself on GitHub.

Please proceed with a Pull Request only after you're assigned. It'd be sad if your Pull Request (and your hardwork) isn't accepted just because it isn't ideologically compatible.

# Developing the gem

1. Install with

    ```sh
    git clone https://github.com/athityakumar/kindle_fortune
    cd kindle_fortune
    gem install bundler
    bundle install
    ```

2. Make your changes in a different git branch (say, `adds-improvement`). These changes can be

    - fixing existing bugs
    - improving details displayed

3. (Optional) To test whether `kindle_fortune` executable is working properly, do
    ```sh
    rake install
    ```
    Then install the gem file in the folder `pkg`. After that to use the new binary,
    ```sh
    kindle_fortune # start using kindle_fortune
    ```

4. Check before pushing

    ```sh
    bundle exec rubocop
    bundle exec rspec
    ```

