### autodeps.mk --- src/Makefile fragment for GNU Emacs

## This is inserted in src/Makefile if AUTO_DEPEND=yes.

-include $(ALLOBJS:%.o=${DEPDIR}/%.d)
