/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#00ff22", "#008822" },
	[SchemeSel] = { "#008822", "#00ff22" },
	[SchemeSelHighlight] = { "#005816", "#00ff22" },
	[SchemeNormHighlight] = { "#005816", "#008822" },
	[SchemeOut] = { "#000000", "#00ffff" },
};
static const unsigned int alphas[SchemeLast][2]      = {
        /*               fg      bg     */
        [SchemeNorm] = { OPAQUE, ALPHA},
        [SchemeSel]  = { OPAQUE, OPAQUE},
        [SchemeSelHighlight]  = { OPAQUE, OPAQUE},
        [SchemeNormHighlight]  = { OPAQUE, ALPHA},
        [SchemeOut]  = { OPAQUE, ALPHA},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
static unsigned int maxhist   = 2000;
static int histnodup          = 1; /* if 0, record repeated histories */

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
