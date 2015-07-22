# findpeaks

Finds the peak (largest) values of the first parameter in [USGS NWIS] timeseries
data files and prints the date and time of its occurrence along with the corresponding value.  

## Version
0.0.1

## Features

* finds the peak values of the first parameter in [USGS NWIS] timeseries data files
    * USGS NWIS data files are either daily timeseries (1 observation per day) or unit timeseries (1 observation every 15 minutes)
    * any parameter is valid - discharge, stage, temperature, etc.
* can be used on multiple [USGS NWIS] timeseries data files
* can find more than 1 peak - top 3 peaks, top 10 peaks, etc.

## Example

Find peak in a daily value timeseries file.
```
$ bash findpeak.sh --daily data/03290500-dv.txt
Processing daily timeseries

data/03290500-dv.txt
2014-02-06      64700
```

Find the top 2 peaks in a unit value timeseries file.
```
$ bash findpeaks.sh -2 -u data/*uv.txt
Processing unit timeseries

data/03253000-uv.txt
2015-04-03 15:00        EDT     20.21
2015-04-03 15:15        EDT     20.19
```

Find the peak for multiple daily value timeseries files.
```
$ bash findpeak.sh -d data/*dv.txt
Processing daily timeseries

data/03290500-dv.txt
2014-02-06      64700

data/0329800-dv.txt
2013-10-06      8380

```

## Installation

Download the repository.

or

Clone the repository:
```
$ git clone https://github.com/jlant/findpeaks.git
```

## Usage

```
Name:
  findpeaks.sh - finds the largest (peak) value in USGS NWIS timeseries data files

Usage:
  findpeaks.sh [numpeaks] filetype files

Parameters:
  filetype    [[-d | --daily ] | [-u | --unit]]  
  files       list of data file(s) to process

Options:
  numpeaks    number of peaks to find

Help:
    findpeaks.sh [-h | --help]

Description:
  The findpeaks.sh script finds the largest (peak) value in USGS NWIS (http://waterdata.usgs.gov/nwis) timeseries data files.
  The data files from the USGS NWIS are either daily timeseries (1 observation per day) or unit timeseries (1 observation every 15 minutes)

Example:
  findpeaks.sh -2 -d sample-daily-value-file.txt
```

## Tests
Running the tests, using the commands below, will print a fair bit of output
to the screen where the "Expected" values and be "Actual" values can be compared.

Run tests from the projects root directory `findpeaks/`:
```sh
$ bash runtests.sh
Testing 3 arguments 1 peak 1 daily value file

Expected:

tests/test-dv.txt
2014-09-04      50

Actual:

Processing daily timeseries

tests/test-dv.txt
2014-09-04      50

...

Testing multiple files with 2 arguments 1 peak 1 unit value file - should use default of 1 for number of peaks

Expected:

tests/test-03293000-uv.txt
2015-07-21 00:00        EDT     1.28

tests/test-uv.txt
2015-03-16 00:30        EDT     20

Actual:

Processing unit timeseries

tests/test-03293000-uv.txt
2015-07-21 00:15        EDT     1.28

tests/test-uv.txt
2015-03-16 00:30        EDT     20
```

Run tests from within the `tests/` directory:
```sh
$ bash test-findpeaks.sh
```

## Requirements

A Unix (like) environment.

Windows - [GitBash](https://msysgit.github.io/) or [Cygwin](https://www.cygwin.com/)

## License

MIT License

Please see `LICENSE` file

## Contributing

Explain how to help and contribute to the project.

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## Author

Jeremiah Lant  
jeremiahlant@gmail.com  
@jeremiahlant


[USGS NWIS]:http://waterdata.usgs.gov/nwis
