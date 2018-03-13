# SALT \| Highstate as scheduled job \(config pull\) {#salt_highstate_per_scheduled_job_config_pullen}

folgendes in die &lt;minion-config&gt; eintragen:

```
schedule:
  highstate:
    function: state.highstate
    minutes: 60
```

## Weblinks {#weblinks}

* [https://docs.saltstack.com/en/latest/topics/jobs/\#scheduling-highstates](https://docs.saltstack.com/en/latest/topics/jobs/#scheduling-highstates)



