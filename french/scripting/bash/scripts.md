<!-- TITLE: Bash - Scripts -->
<!-- SUBTITLE: A quick summary of Scripts -->


```batchfile
#!/bin/bash
```


# Les conditions

```batchfile
if [ test ]
then
        echo "C'est vrai"
fi
```

Important: il doit y avoir des espaces à l'intérieur des crochets. On doit pas écrire [test] mais [ test ].

```batchfile
if [ test ]; then
        echo "C'est vrai"
fi
```



```batchfile
if [ test ]
then
        echo "Le premier test a été vérifié"
elif [ autre_test ]
then
        echo "Le second test a été vérifié"
elif [ encore_autre_test ]
then
        echo "Le troisième test a été vérifié"
else
        echo "Aucun des tests précédents n'a été vérifié"
fi
```

