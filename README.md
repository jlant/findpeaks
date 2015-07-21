# findpeaks

findpeak finds the largest (peak) value of the first parameter in [USGS NWIS](http://waterdata.usgs.gov/nwis) timeseries
data files and prints the date and time of its occurrence along with the corresponding value.  

## Version
0.0.1

## Features

* finds the peak value of any [USGS NWIS](http://waterdata.usgs.gov/nwis) timeseries data file; USGS NWIS data files are either daily timeseries (1 observation per day) or unit timeseries (1 observation every 15 minutes)
* can be run on any number of [USGS NWIS](http://waterdata.usgs.gov/nwis) timeseries data files
* option to find any number of peaks; top 3, top 10, etc.

## Example

A single daily value file.
```
$ bash findpeak.sh --daily data/03290500-dv.txt
Processing daily timeseries

data/03290500-dv.txt
2014-02-06      64700
```

Top 2 peaks in unit value file.
```
$ bash findpeaks.sh -2 -u data/*uv.txt
Processing unit timeseries

data/03253000-uv.txt
2015-04-03 15:00        EDT     20.21
2015-04-03 15:15        EDT     20.19
```

Multiple daily value files.
```
$ bash findpeak.sh -d data/*dv.txt
Processing daily timeseries

data/03290500-dv.txt
2014-02-06      64700

data/0329800-dv.txt
2013-10-06      8380

```


## Installation

Download or clone the repository.

Clone the repository:
```
$ git clone https://github.com/jlant/findpeaks.git
```

## Usage

```
Name:
  findpeaks.sh - finds the largest (peak) value in USGS NWIS (http://waterdata.usgs.gov/nwis) data files

Usage:
  findpeaks.sh [numpeaks] FILETYPE FILES

Parameters:
  FILETYPE    [[-d | --daily ] | [-u | --unit]]  
  FILES       list of data file(s) to process

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

```sh
$ bash runtests.sh
```

## Requirements

Unix (like) environment.

Windows - [GitBash](https://msysgit.github.io/) or [Cygwin](https://www.cygwin.com/)

## License

MIT License (see LICENSE file)

## Contributing

Explain how to help and contribute to the project.

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## Author(s)

Jeremiah Lant  
jeremiahlant@gmail.com
