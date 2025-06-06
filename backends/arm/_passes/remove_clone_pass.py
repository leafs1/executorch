# Copyright 2024-2025 Arm Limited and/or its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

# pyre-unsafe

from executorch.exir.dialects._ops import ops as exir_ops
from executorch.exir.pass_base import ExportPass


class RemoveClonePass(ExportPass):
    """Remove all clones from graph_module"""

    def call_operator(self, op, args, kwargs, meta):
        if op != exir_ops.edge.aten.clone.default:
            return super().call_operator(op, args, kwargs, meta)

        if len(args) != 1:
            raise ValueError(
                f"clone operator expects exactly one argument, got {len(args)}"
            )
        return args[0]
