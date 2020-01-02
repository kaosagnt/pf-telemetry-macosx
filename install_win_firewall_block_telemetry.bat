@echo off

@rem %BEGIN_COPYRIGHT%
@rem 
@rem Copyright 2019-2020 Ian McWilliam (kaosagnt@gmail.com).
@rem
@rem Permission to use, copy, modify, and distribute this software for any
@rem purpose with or without fee is hereby granted, provided that the above
@rem copyright notice and this permission notice appear in all copies.
@rem
@rem THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
@rem WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
@rem MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
@rem ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
@rem WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
@rem ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
@rem OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
@rem
@rem %END_COPYRIGHT%

Powershell.exe -executionpolicy remotesigned -File install-win-firewall-block-telemetry.ps1
