extends "res://test/gut/gut.gd".Test


# #############
# Seutp/Teardown
# #############
func prerun_setup():
	print("prerun")

func setup():
	print("setup")

func teardown():
	print("teardown")

func postrun_teardown():
	print("postrun")

# #############
# Tests
# #############
func test_pending():
# 	Characters
	#logger
	#logger.set_default_output_level(logger.VERBOSE)
# 	logger.warn("hi")
	#assert_eq(1/2, 1.0/2)
	assert_eq(1, 1)
	#assert_eq(1, 1.0)
