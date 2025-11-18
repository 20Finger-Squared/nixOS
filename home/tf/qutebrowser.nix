{ home-manager, nixpkgs-24-11, ... }:
{
    programs.qutebrowser = {
        enable = true;
        enableDefaultBindings = true;
        package = [ nixpkgs-24-11.qutebrowser ];
        perDomainSettings = {
        };

        quickmarks = {
            nixpkgs = "";
            nixlib = "";
            ytm = "";
            yt = "";
        };

        searchEngines = {
            np = "";
            no = "";
            yt = "";
            ytm = "";
        };
        settings = {
            confirm_quit = true;

            colors = {
                completion = {
                    category = {
                        fg = ;
                        bg = ;
                        border = {
                            bottom = ;
                            top = ;
                        };
                    };
                    even.bg = ;
                    odd.bg = ;
                    fg = ;
                    item = {
                        selected = {
                            fg = ;
                            bg = ;
                            border = {
                                top = ;
                                bottom = ;
                            };
                            match.fg = ;
                        };
                    };
                    match.fg = ;
                    scrollbar = {
                        fg = ;
                        bg = ;
                    };
                };

                contextmenu = {
                    disabled = {
                        fg = ;
                        bg = ;
                    };
                    menu = {
                        fg = ;
                        bg = ;
                    };
                    selected = {
                        fg = ;
                        bg = ;
                    };
                };

                downloads = {
                    bar.bg = ;
                    error = {
                        fg = ;
                        bg = ;
                    };
                    start = {
                        fg = ;
                        bg = ;
                    };
                    stop = {
                        fg = ;
                        bg = ;
                    };
                    system = {
                        fg = ;
                        bg = ;
                    };
                };

                hints = {
                    bg = ;
                    fg = ;
                    match.fg = ;
                };

                keyhint = {
                    fg = ;
                    bg = ;
                    suffix = {
                        fg = ;
                        bg = ;
                    };
                };

                messages = {
                    error = {
                        border = ;
                        fg = ;
                        bg = ;
                    };
                    info = {
                        border = ;
                        fg = ;
                        bg = ;
                    };
                    warning = {
                        border = ;
                        fg = ;
                        bg = ;
                    };
                };

                prompts = {
                    border = ;
                    fg = ;
                    bg = ;
                    selected = {
                        fg = ;
                        bg = ;
                    };
                };

                statusbar = {
                    caret = {
                        fg = ;
                        bg = ;
                        selection = {
                            fg = ;
                            bg = ;
                        };
                        command = {
                            fg = ;
                            bg = ;
                            private = {
                                fg = ;
                                bg = ;
                            };
                        };
                    };
                    insert = {
                        fg = ;
                        bg = ;
                    };
                    normal = {
                        fg = ;
                        bg = ;
                    };
                    passthrough = {
                        fg = ;
                        bg = ;
                    };
                    private = {
                        fg = ;
                        bg = ;
                    };
                    progress.bg = ;
                    url = {
                        error.fg = ;
                        fg = ;
                        hover.fg = ;
                        success = {
                            http.fg = ;
                            https.fg = ;
                        };
                        warn.fg = ;
                    };
                };

                tabs = {
                    bar.bg = ;
                    even = {
                        bg = ;
                        fg = ;
                    };
                    indicator = {
                        error = ;
                        start = ;
                        stop = ;
                        system = ;
                    };
                    odd = {
                        bg = ;
                        fg = ;
                    };
                    pinned = {
                        even = {
                            bg = ;
                            fg = ;
                        };
                        odd = {
                            bg = ;
                            fg = ;
                        };
                        selected = {
                            even = {
                                bg = ;
                                fg = ;
                            };
                            odd = {
                                bg = ;
                                fg = ;
                            };
                        };
                    };
                    selected = {
                        even = {
                            bg = ;
                            fg = ;
                        };
                        odd = {
                            bg = ;
                            fg = ;
                        };
                    };
                };

                tooltip = {
                    bg = ;
                    fg = ;
                };

                webpage = {
                    bg = ;
                    preferred_color_scheme = ;
                    darkmode = {
                        algorithm = ;
                        contrast = ;
                        enabled = ;
                        policy = {
                            images = ;
                            page = ;
                        };
                        threshold = {
                            background = ;
                            foreground = ;
                        };
                    };
                };
            };
        };
    };
}
