# dotLottieConverter

dotLottie converter is a command-line tool that converts Lottie JSON files to dotLottie files using the [dotLottieLoader](https://github.com/dotlottie/dotlottieLoader-ios) library written in Swift.

## Installation

1. Clone this repository.
2. Run `swift build -c release`.
3. Use binary in `.build/release` folder.

## Usage

To use dotLottie converter, run the following command in the terminal:

```sh
/path/to/dotLottieConverter <lottie files> [--output <output folder>] [--verbose]
```

### Arguments

- `<lottie files>`: A space-separated list of Lottie JSON files to be converted to dotLottie.
- `--output <output folder>` (optional): The folder where the converted dotLottie files will be saved.
  If not specified, files will be saved to the temp folder.
- `--color <color>` (optional): The theme color for the dotLottie file. Default is `#ffffff`.
- `--no-loop` (optional): Create a dotLottie files with looping disabled.
- `--verbose` (optional): Print the path of each created dotLottie file.
- `--help` (optional): Show help information.

### Examples

```sh
/path/to/dotLottieConverter file1.json file2.json --output /path/to/output/folder --verbose
```

This will convert `file1.json` and `file2.json` to .lottie files and save them
in the `/path/to/output/folder` directory. The path of each converted .lottie
file will be printed to the console.

```sh
dotLottieConverter <lottie files – lottiefiles/*.json> [--output <output folder>] [--color <color>] [--no-loop] [--verbose] [--help]
```

This will convert all JSON files in the `lottiefiles` directory to dotLottie
files with the theme color `#ff0000` and looping disabled, and save them in the
`/path/to/output/folder` directory. The path of each created dotLottie file
will be printed to the console.

## Contributing

All contributions are welcome.

Project was created by [Matěj Kašpar Jirásek](https://iosdev.space/@mkj).

Project is licensed under [MIT license](LICENSE).
