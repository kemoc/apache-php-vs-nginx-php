# README.md

Dockers to compare speed apache mod_php7.1 with nginx and php-fpm7.1

I was using wrk2, from:

https://github.com/giltene/wrk2

Tests on my PC shows,

A. in PHP test:

```
# Apache + mod_php
$ wrk -t4 -c100 -d30s -R100 --latency http://test.loc:40480/test.php
Running 30s test @ http://test.loc:40480/test.php
  4 threads and 100 connections
  Thread calibration: mean lat.: 1171.311ms, rate sampling interval: 8331ms
  Thread calibration: mean lat.: 1248.781ms, rate sampling interval: 8359ms
  Thread calibration: mean lat.: 1247.369ms, rate sampling interval: 8343ms
  Thread calibration: mean lat.: 1253.015ms, rate sampling interval: 8351ms
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.23ms  434.34us   3.17ms   68.16%
    Req/Sec    23.25      0.43    24.00    100.00%
  Latency Distribution (HdrHistogram - Recorded Latency)
 50.000%    1.21ms
 75.000%    1.50ms
 90.000%    1.79ms
 99.000%    2.42ms
 99.900%    2.87ms
 99.990%    3.17ms
 99.999%    3.17ms
100.000%    3.17ms

# Nginx + php-fpm
$ wrk -t4 -c100 -d30s -R100 --latency http://test.loc:40481/test.php
Running 30s test @ http://test.loc:40481/test.php
  4 threads and 100 connections
  Thread calibration: mean lat.: 1.456ms, rate sampling interval: 10ms
  Thread calibration: mean lat.: 1.463ms, rate sampling interval: 10ms
  Thread calibration: mean lat.: 1.495ms, rate sampling interval: 10ms
  Thread calibration: mean lat.: 1.490ms, rate sampling interval: 10ms
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.51ms  464.89us   3.14ms   66.58%
    Req/Sec    25.20     68.73   333.00     87.59%
  Latency Distribution (HdrHistogram - Recorded Latency)
 50.000%    1.49ms
 75.000%    1.82ms
 90.000%    2.11ms
 99.000%    2.66ms
 99.900%    3.10ms
 99.990%    3.14ms
 99.999%    3.14ms
100.000%    3.14ms
```

but sometimes Apache wins with Nginx.

B. Static TXT file test:

```
# Apache + mod_php
radek2@www:~$ wrk -t4 -c100 -d30s -R100 --latency http://test.loc:40480/test.txt
Running 30s test @ http://test.loc:40480/test.txt
  4 threads and 100 connections
  Thread calibration: mean lat.: 1342.856ms, rate sampling interval: 9093ms
  Thread calibration: mean lat.: 1427.834ms, rate sampling interval: 9093ms
  Thread calibration: mean lat.: 1426.109ms, rate sampling interval: 9101ms
  Thread calibration: mean lat.: 1434.595ms, rate sampling interval: 9109ms
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.09ms  450.77us   5.71ms   69.74%
    Req/Sec    24.00      0.00    24.00    100.00%
  Latency Distribution (HdrHistogram - Recorded Latency)
 50.000%    1.05ms
 75.000%    1.36ms
 90.000%    1.65ms
 99.000%    2.24ms
 99.900%    3.35ms
 99.990%    5.72ms
 99.999%    5.72ms
100.000%    5.72ms

# Nginx
radek2@www:~$ wrk -t4 -c100 -d30s -R100 --latency http://test.loc:40481/test.txt
Running 30s test @ http://test.loc:40481/test.txt
  4 threads and 100 connections
  Thread calibration: mean lat.: 1.079ms, rate sampling interval: 10ms
  Thread calibration: mean lat.: 1.003ms, rate sampling interval: 10ms
  Thread calibration: mean lat.: 1.004ms, rate sampling interval: 10ms
  Thread calibration: mean lat.: 1.025ms, rate sampling interval: 10ms
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.04ms  457.06us   4.43ms   70.53%
    Req/Sec    25.46     69.63   333.00     87.64%
  Latency Distribution (HdrHistogram - Recorded Latency)
 50.000%    1.01ms
 75.000%    1.30ms
 90.000%    1.60ms
 99.000%    2.22ms
 99.900%    3.94ms
 99.990%    4.43ms
 99.999%    4.43ms
100.000%    4.43ms

```


