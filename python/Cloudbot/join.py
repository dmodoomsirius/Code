from cloudbot import hook

@hook.irc_raw('004')
def onReadyJoin(conn, bot):
    conn.send("JOIN #BBM-bots")
    conn.send("JOIN #dmodtest")
    conn.send("JOIN #BuiltBrokenModding")
    conn.send("JOIN #BuiltBroken")
    #conn.send("JOIN #Razz")
    conn.send("JOIN #MadScience")
    con.send("JOIN #icbm')
    conn.send("JOIN #Kolatra")
    conn.send("JOIN #Kolatra-Dev")