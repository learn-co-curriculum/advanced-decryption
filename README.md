---
tags: cs, comp sci, computer science, strings, decode
languages: ruby
resources: 1
---

# Advanced Decryption

## Objectives

Use the steps below to make a functioning method that decodes a string. It will decrypt in the following ways:

1. Find the pair of identical characters that are farthest apart, and contain no pairs of identical characters between them. (e.g. for "abcbba" the chosen characters should be the first and last b) In the event of a tie, choose the left-most pair (e.g. for "aabcbded" the chosen characters should be the first and second "b").

2. Remove one of the characters in the pair, and move the other to the end of the string. (e.g. for "abcbba" you'd end up with "acbab").

3. Repeat steps 1 and 2 until no repeated characters remain.

4. If the resulting string contains an underscore, remove it and any characters after it (e.g. "abc_def" would become "abc").

5. The remaining string is the answer.

## Examples

#### Ex. 1

For example, for the input "daccadfghd_i" the answer is "fgh".

```text
daccadfghd_i
     X   |   # Remove one d, move the other to the end
         `v  
daccafgh_id
  X|         # Remove one c, move the other to the end 
   `-----v
daafgh_idc
 X|
  `-----v
dfgh_idca
X     |
      `v
fgh_icad
   XXXXX    # Remove everything after and including the _
   
fgh
    
```

#### Ex. 2

```text
abacbcbefge
aaccbefgeb
aaccbfgbe
aaccfgeb
ccfgeba
fgebac      # No underscore, so nothing is removed
    
```

#### Ex. 3

```text
_a_abda_    # a_abda is the longest match; _abd are all unique
__abd_a     # __abd_ is the longest match; _abd are all unique
_abda_      
_bd_a
bda_
bda         #Remove underscore and everything after it
    
```

#### Ex. 4

```text
ttvmswxjzdgzqxotby_lslonwqaipchgqdo_yz_fqdagixyrobdjtnl_jqzpptzfcdcjjcpjjnnvopmh
ttvmswxjzdgzqxotby_lslonwqaipchgqdo_z_fqdagixrobdjtnl_jqzpptzfcdcjjcpjjnnvopmhy
ttvmswxjzdgzqxotby_lslonwqaipchgqdo_z_fqagixrobjtnl_jqzpptzfcdcjjcpjjnnvopmhyd
ttvmswxjzdgzqxotby_lslonwqaipchgqdoz_fqagixrobjtnljqzpptzfcdcjjcpjjnnvopmhyd_
ttvmswxjzdgzqxotby_lslonwaipchgqdoz_fagixrobjtnljqzpptzfcdcjjcpjjnnvopmhyd_q
ttvmswxjzdgzqxotby_lslonwipchgqdoz_fgixrobjtnljqzpptzfcdcjjcpjjnnvopmhyd_qa
ttvmswxjzdgzqxotby_lslnwipchgqdz_fgixrobjtnljqzpptzfcdcjjcpjjnnvopmhyd_qao
ttvmswxjzdgzqxotby_lslnwipchgqdz_fgixrobjtnljqzpptzfcdcjjcpjjnnvpmhyd_qao
ttvmswxjzdgzqxotby_lslnwipchqdz_fixrobjtnljqzpptzfcdcjjcpjjnnvpmhyd_qaog
ttvmswxjzdgzqxotby_lslnwpchqdz_fxrobjtnljqzpptzfcdcjjcpjjnnvpmhyd_qaogi
ttvmswxjzdgzqxotby_lslwpchqdz_fxrobjtljqzpptzfcdcjjcpjjnnvpmhyd_qaogin
ttvmswxjzdgzqxotby_slwpchqdz_fxrobjtjqzpptzfcdcjjcpjjnnvpmhyd_qaoginl
ttvmswxjzdgzqxotby_slwpchqdz_fxrobjtjqzpptzfcdcjjcpjjnvpmhyd_qaogiln
ttvmswxjzdgzqxotby_slwpchqdz_fxrobjtjqzpptzfcdcjjcpjjvpmhyd_qaogiln
ttvmswxjzdgzxotby_slwpchdz_fxrobjtjqzpptzfcdcjjcpjjvpmhyd_qaogilnq
ttvmswxjzgzxotby_slwpchz_fxrobjtjqzpptzfcdcjjcpjjvpmhyd_qaogilnqd
ttvmswxjgzxotby_slwpch_fxrobjtjqzpptzfcdcjjcpjjvpmhyd_qaogilnqdz
ttvmswxjgzxotbyslwpchfxrobjtjqzpptzfcdcjjcpjjvpmhyd_qaogilnqdz_
ttvmswjgzxotbyslwpchfrobjtjqzpptzfcdcjjcpjjvpmhyd_qaogilnqdz_x
ttvmswjgzxtbyslwpchfrbjtjqzpptzfcdcjjcpjjvpmhyd_qaogilnqdz_xo
tvmswjgzxbyslwpchfrbjtjqzpptzfcdcjjcpjjvpmhyd_qaogilnqdz_xot
tvmswjgzxyslwpchfrjtjqzpptzfcdcjjcpjjvpmhyd_qaogilnqdz_xotb
tvmswgzxyslwpchfrjtqzpptzfcdcjjcpjjvpmhyd_qaogilnqdz_xotbj
tvmswgxyslwpchfrjtqpptzfcdcjjcpjjvpmhyd_qaogilnqdz_xotbjz
tvmswgxyslwpchfrjtqpptzfcdcjjcpjjvpmhyd_qagilnqdz_xtbjzo
tvmswgxyslwchfrjtqptzfcdcjjcpjjvpmhyd_qagilnqdz_xtbjzop
tvmsgxyslchfrjtqptzfcdcjjcpjjvpmhyd_qagilnqdz_xtbjzopw
tvmsgxyslchfrjtqptzfcdcjjcpjjvpmhyd_agilndz_xtbjzopwq
tvmsgxyslchfrjtqptzfcdcjjcpjjvpmhydagilndzxtbjzopwq_
tvmsgxyslchfrjtqptzfcdcjjcpjjvpmhyagilnzxtbjzopwq_d
tvmsgxyslchfrjtqptzfcdcjjcpjvpmhyagilnzxtbzopwq_dj
tvmgxylchfrjtqptzfcdcjjcpjvpmhyagilnzxtbzopwq_djs
vmgxylchfrjtqpzfcdcjjcpjvpmhyagilnzxtbzopwq_djst
vmgxylchfrjtqpzfcdcjjcpjvpmhyagilnzxbzopwq_djst
vmgxylchrjtqpzcdcjjcpjvpmhyagilnzxbzopwq_djstf
vmgxylhrjtqpzcdjjcpjvpmhyagilnzxbzopwq_djstfc
vmgxylhrtqpzcdjcpjvpmhyagilnzxbzopwq_djstfcj
vmgxylhrtqpzcdjcpjvpmhyagilnzxbzopwq_dstfcj
vmgxylhrtqpzdjpjvpmhyagilnzxbzopwq_dstfcjc
vmgxylhrtqzdjjvpmhyagilnzxbzopwq_dstfcjcp
vmgxylhrtqzdjjvpmhyagilnxbopwq_dstfcjcpz
vmgxylhrtqzdjjvmhyagilnxbowq_dstfcjcpzp
vmgxylhrtqzdjvmhyagilnxbowq_dstfccpzpj
vmgxylhrtzdjvmhyagilnxbow_dstfccpzpjq
vmgxylhrtzjvmhyagilnxbow_stfccpzpjqd
vmgxylhrzjvmhyagilnxbow_sfccpzpjqdt
mgxylhrzjmhyagilnxbow_sfccpzpjqdtv
gxylhrzjhyagilnxbow_sfccpzpjqdtvm
gxylrzjyagilnxbow_sfccpzpjqdtvmh
gxyrzjyaginxbow_sfccpzpjqdtvmhl
gxrzjaginxbow_sfccpzpjqdtvmhly
grzjaginbow_sfccpzpjqdtvmhlyx
rzjainbow_sfccpzpjqdtvmhlyxg
rzjainbow_sfcczjqdtvmhlyxgp
rzjainbow_sfzjqdtvmhlyxgpc
rjainbow_sfjqdtvmhlyxgpcz
rainbow_sfqdtvmhlyxgpczj
rainbow
```

## Bonus

In `spec/decoder_spec.rb`, there is one pending test. Remove the `x` before the final test to run it. Ideally, your code should be fast enough to pass this test in under 45 minutes. 

This bonus will be very challenging, so give yourself a couple days of thinking about it if the answer is not obvious. Remember, recursion may not be the fastest way to approach this problem.

## Resources
* [Ruby Docs](http://www.ruby-doc.org/core-2.1.2/) - [Strings](http://www.ruby-doc.org/core-2.1.2/String.html)
