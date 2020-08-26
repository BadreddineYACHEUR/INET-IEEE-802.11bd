import storyboard as sb

def createStories(board):
    region = sb.PolygonCondition([
        sb.Coord(0, 600), sb.Coord(600, 600),
        sb.Coord(600, 0), sb.Coord(0, 0)])

    fast = sb.SpeedConditionGreater(0)
    accident_position = sb.AndCondition(region, fast)
    story = sb.Story(accident_position, [sb.SignalEffect("accident detected")])
    board.registerStory(story)
