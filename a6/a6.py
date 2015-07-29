! /Library/Frameworks/Python.framework/Versions/3.4/bin/python
"""
Assignment Six
by Landon Soriano
"""

import requests 
import re
DEBUG = False 

STEAM_GAMES_URL = "http://store.steampowered.com/search/?specials=1"
STEAM_GAME_PAT = '<span class="title">.*?-(\d*)%.*?</span>'
STEAM_GAME_DISCAMT = '<span>-(\d*)%</span>'
GAMESPOT_URL = "http//gamespot.com/search" 
GAMESPOT_URL_PAT = '<a href="([^"]+)".*?</a>'
GAMESPOT_SCORE_PAT = '<span itemprop="ratingValue">([\d.]+)</span>'

no_review_games = []
reviewed_games = []

r = requests.get(STEAM_GAMES_URL)
if DEBUG: print(r.text)
search_result = re.findall(STEAM_GAME_PAT, r.text, re.S)
for game in search_result:
    if DEBUG: print("discount = {}, URL = {}, name = {}".format(game[0], game[1], game[2]))
    game_name = re.sub("\s*$", "", game[2])
    if DEBUG: print("cleaned up game name is {}".format(game_name))
    if int(game[0]) >= 10:
        print("discounted game: {}".format(game[1]))
        review = requests.get(IGN_URL,params={'q':game_name+' review'})
        if DEBUG: print("review URL is: {}".format(review.url))
        game_name_em = "<em>"+re.sub(" ", "</em> <em>", game_name)+"</em> <em>Review</em>"
        if DEBUG: print("game_name_em is: {}".format(game_name_em))
        review_result = re.search(GAMESPOT_SCORE_PAT+game_name_em, review.text, re.S|re.I)
        if review_result == None:
            print("no review for: {}".format(game_name))
            no_review_games.append((game_name, game[1], game[0]))
            
        else:
            print("found review for: {}".format(game_name))
            review_url = review_result.group(1)
            review = requests.get(review_url)
            score = re.search(GAMESPOT_SCORE_PAT, review.text)
            reviewed_games.append((game_name, game[1], game[0], review_url, score.group(1)))
            print("score is: ".format(score.group(1)))


         with open(ranking.html, 'w') as f:
        f.write(
        <!DOCTYPE html>
            <html lang="en">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            
            <head>
                <title>Steam Special Sale Games with GameSpot Review Scores</title>
            </head>
        
            <body>
                <h1>Steam Special Sale Games with GameSpot Review Scores</h1>
    
            <table>
                <tr><th>Game</th><th>Discount</th><th>GameSpot Score</th></tr>
            <tr><td>
                <a href="http://store.steampowered.com/">The Talos Principle</a></td><td>-50%</td><td>
                <a href="http://www.gamespot.com/reviews/the-talos-principle-review/1900-6415993/">9</a></td></tr><tr><td>
                <a href="http://store.steampowered.com/app/214510/?snr=1_7_7_204_150_1">LEGO The Lord of the Rings</a></td><td>-75%</td><td>
                <a href="http://www.gamespot.com/reviews/lego-the-lord-of-the-rings-review/1900-6400417/">8</a></td></tr><tr><td>
                <a href="http://store.steampowered.com/app/21130/?snr=1_7_7_204_150_1">LEGO Harry Potter: Years 1-4</a></td><td>-75%</td><td>
                <a href="http://www.gamespot.com/reviews/lego-harry-potter-years-1-4-review/1900-6270597/">8</a></td></tr><tr><td>
                <a href="http://store.steampowered.com/app/204120/?snr=1_7_7_204_150_1">LEGO Harry Potter: Years 5-7</a></td><td>-75%</td><td>
                <a href="http://www.gamespot.com/reviews/lego-harry-potter-years-5-7-review/1900-6346752/">8</a></td></tr><tr><td>
                <a href="http://store.steampowered.com/app/250400/?snr=1_7_7_204_150_1">How to Survive</a></td><td>-80%</td><td>
                <a href="http://www.gamespot.com/reviews/how-to-survive-review/1900-6415510/">7</a></td></tr><tr><td>
                <a href="http://store.steampowered.com/app/217200/?snr=1_7_7_204_150_1">Worms Armageddon</a></td><td>-75%</td><td>
                <a href="http://www.gamespot.com/reviews/worms-armageddon-review/1900-2545527/">7</a></td></tr><tr><td>
                <a href="http://store.steampowered.com/app/21000/?snr=1_7_7_204_150_1">LEGO Batman</a></td><td>-75%</td><td>
                <a href="http://www.gamespot.com/reviews/lego-batman-review/1900-6198251/">6</a></td></tr><tr><td>
                <a href="http://store.steampowered.com/app/274940/?snr=1_7_7_204_150_1">Depth</a></td><td>-50%</td><td>
                <a href="http://www.gamespot.com/reviews/depth-review/1900-6415941/">5</a></td></tr><tr><td>
                <a href="http://store.steampowered.com/app/213330/?snr=1_7_7_204_150_1">LEGO Batman 2 DC Super Heroes </a></td><td>-75%</td><td>unknown</td></tr><tr><td>
                <a href="http://store.steampowered.com/app/313690/?snr=1_7_7_204_150_1">LEGO Batman3: Beyond Gotham</a></td><td>-66%</td><td>unknown</td></tr><tr><td>
                <a href="http://store.steampowered.com/app/249130/?snr=1_7_7_204_150_1">LEGO Marvel Super Heroes</a></td><td>-75%</td><td>unknown</td></tr><tr><td>
                <a href="http://store.steampowered.com/app/250560/?snr=1_7_7_204_150_1">Fight The Dragon</a></td><td>-60%</td><td>unknown</td></tr><tr><td>
                <a href="http://store.steampowered.com/app/267530/?snr=1_7_7_204_150_1">The LEGO Movie - Videogame</a></td><td>-75%</td><td>unknown</td></tr><tr><td>
                <a href="http://store.steampowered.com/app/285160/?snr=1_7_7_204_150_1">LEGO The Hobbit</a></td><td>-75%</td><td>unknown</td></tr><tr><td>
                <a href="http://store.steampowered.com/app/247000/?snr=1_7_7_204_150_1">Talisman</a></td><td>-70%</td><td>unknown</td></tr><tr><td>
                <a href="http://store.steampowered.com/app/273580/?snr=1_7_7_204_150_1">Descent 2</a></td><td>-50%</td><td>unknown</td></tr><tr><td>
                <a href="http://store.steampowered.com/app/314160/?snr=1_7_7_204_150_1">Microsoft Flight Simulator X: Steam Edition</a></td><td>-50%</td><td>unknown</td></tr><tr><td>
                <a href="http://store.steampowered.com/app/315810/?snr=1_7_7_204_150_1">eden*</a></td><td>-50%</td><td>unknown</td></tr><tr><td>
                <a href="http://store.steampowered.com/app/263460/?snr=1_7_7_204_150_1">Girls Like Robots</a></td><td>-50%</td><td>unknown</td></tr>
                </table>
            </body>
            </html> 