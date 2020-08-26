import storyboard as sb

def createStories(board):
    region = sb.PolygonCondition([
        sb.Coord(120, 360), sb.Coord(360, 360),
        sb.Coord(360, 120), sb.Coord(120, 120)])
    fast = sb.SpeedConditionGreater(0)
    accident_position = sb.AndCondition(region, fast)
    story = sb.Story(accident_position, [sb.SignalEffect("accident detected")])
    board.registerStory(story)
