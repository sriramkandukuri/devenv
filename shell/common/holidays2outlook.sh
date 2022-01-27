awk '
    BEGIN {
        num = 0
    }
    /^Holiday List/ {
        year = $(NF)
    }
    /Noida|Hyderabad|Pune|Bangalore/ {
        if (num > 0)
            printf("\n[NXP %s holidays %s] %s\n%s",city,year,num,hols);
        city = $NF;
        num=0;
        hols=""
    }
    /^[0-9]/{
        cmd = "date \"+%Y/%m/%d\" -d "$(NF-1) " 2>&1"
        cmd | getline d
        close(cmd)
        if (substr(d, 0,4) != "date") {
            for(i=2; i<= NF-2; i++) {
                tmp = gsub(/\//,"",$i)
                if ( i == NF-2 )
                    hols = sprintf("%s%s,",hols, $i)
                else
                    hols = sprintf("%s%s ",hols, $i)
            }
            hols = sprintf("%s%s\n",hols, d);
            num++
        }
    }
    END {
        printf("\n[NXP %s holidays %s] %s\n%s",city,year,num,hols);
    }
' /tmp/hollist.txt

