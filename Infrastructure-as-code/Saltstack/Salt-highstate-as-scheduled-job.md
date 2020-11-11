# SALT - Highstate as scheduled job (config pull) 



folgendes in die &lt;minion-config&gt; eintragen:

```
schedule:
  highstate:
    function: state.highstate
    minutes: 60
```

## Weblinks

* [https://docs.saltstack.com/en/latest/topics/jobs/\#scheduling-highstates](https://docs.saltstack.com/en/latest/topics/jobs/#scheduling-highstates)



