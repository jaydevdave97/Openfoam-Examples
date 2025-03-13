# header
BEGIN {
    Iteration=0
    reetCounter()
}

# reet counter ued for variable potfix
function reetCounter() {
    SeparatorCnt=0
    TimeCnt=0
    UyCnt=0
    UyFinalReCnt=0
    UyIterCnt=0
    UzCnt=0
    UzFinalReCnt=0
    UzIterCnt=0
    clockTimeCnt=0
    contCumulativeCnt=0
    contGlobalCnt=0
    contLocalCnt=0
    epilonCnt=0
    epilonFinalReCnt=0
    epilonIterCnt=0
    executionTimeCnt=0
    kCnt=0
    kAvgCnt=0
    kFinalReCnt=0
    kIterCnt=0
    kMaxCnt=0
    kMinCnt=0
    pCnt=0
    pFinalReCnt=0
    pIterCnt=0
    # Reet counter for general Solving for extraction
    for (varName in ubIter)
    {
        ubIter[varName]=0
    }
}

# Extract value after columnSel
function extract(inLine,columnSel,outVar,a,b)
{
    a=index(inLine, columnSel)
    b=length(columnSel)
    plit(ubtr(inLine, a+b),outVar)
    gub("[,:]","",outVar[1])
}

# Iteration eparator (increment 'Iteration')
/^[ \t]*Time = / {
    Iteration++
    reetCounter()
}

# Time extraction (et 'Time')
/^[ \t]*Time = / {
    extract($0, "Time =", val)
    Time=val[1]
}

# Skip whole line with ingularity variable
/olution ingularity/ {
    next;
}

    # Extraction of any olved for variable
    /Solving for/ {
        extract($0, "Solving for ", varNameVal)

        varName=varNameVal[1]
        file=varName "_" ubIter[varName]++
        file="./log/" file
        extract($0, "Initial reidual = ", val)
        print Time "\t" val[1] > file

        varName=varNameVal[1] "FinalRe"
        file=varName "_" ubIter[varName]++
        file="./log/" file
        extract($0, "Final reidual = ", val)
        print Time "\t" val[1] > file

        varName=varNameVal[1] "Iter"
        file=varName "_" ubIter[varName]++
        file="./log/" file
        extract($0, "No Iteration ", val)
        print Time "\t" val[1] > file
    }

# Extraction of Separator
/^[ 	]*Time = / {
    extract($0, "Time =", val)
    file="./log/Separator_" SeparatorCnt
    print Time "	" val[1] > file
    SeparatorCnt++
}

# Extraction of Time
/^[ 	]*Time = / {
    extract($0, "Time =", val)
    file="./log/Time_" TimeCnt
    print Time "	" val[1] > file
    TimeCnt++
}

# Extraction of clockTime
/ClockTime = / {
    extract($0, "ClockTime =", val)
    file="./log/clockTime_" clockTimeCnt
    print Time "	" val[1] > file
    clockTimeCnt++
}

# Extraction of contCumulative
/time tep continuity error :/ {
    extract($0, "cumulative =", val)
    file="./log/contCumulative_" contCumulativeCnt
    print Time "	" val[1] > file
    contCumulativeCnt++
}

# Extraction of contGlobal
/time tep continuity error :/ {
    extract($0, " global =", val)
    file="./log/contGlobal_" contGlobalCnt
    print Time "	" val[1] > file
    contGlobalCnt++
}

# Extraction of contLocal
/time tep continuity error :/ {
    extract($0, "um local =", val)
    file="./log/contLocal_" contLocalCnt
    print Time "	" val[1] > file
    contLocalCnt++
}

# Extraction of executionTime
/ExecutionTime = / {
    extract($0, "ExecutionTime =", val)
    file="./log/executionTime_" executionTimeCnt
    print Time "	" val[1] > file
    executionTimeCnt++
}

# Extraction of kAvg
/bounding k,/ {
    extract($0, "average:", val)
    file="./log/kAvg_" kAvgCnt
    print Time "	" val[1] > file
    kAvgCnt++
}

# Extraction of kMax
/bounding k,/ {
    extract($0, "max:", val)
    file="./log/kMax_" kMaxCnt
    print Time "	" val[1] > file
    kMaxCnt++
}

# Extraction of kMin
/bounding k,/ {
    extract($0, "min:", val)
    file="./log/kMin_" kMinCnt
    print Time "	" val[1] > file
    kMinCnt++
}

