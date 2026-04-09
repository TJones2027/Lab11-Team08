# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Tyler and Fernando
## Summary
Properly using ripple counters and module counters to implement the provided IO table
## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
It uses a single D flip flop that changes state only on every second rising edge of the input clock

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
its uses ripple counters since it is a asynchronus system and all bits change at once

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
You would need a 17-bit wide ripple counter to get an output frequency close to 1 kHz
