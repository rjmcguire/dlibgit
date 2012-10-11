module git2.attr;

import git2.types;
import mingw.include.stdint;
import mingw.lib.gcc.mingw32._4._6._1.include.stddef;

extern(C):

enum git_attr_t
{
    GIT_ATTR_UNSPECIFIED_T = 0,
    GIT_ATTR_TRUE_T = 1,
    GIT_ATTR_FALSE_T = 2,
    GIT_ATTR_VALUE_T = 3
}

int git_attr_add_macro(git_repository* repo, const(char)* name, const(char)* values);
void git_attr_cache_flush(git_repository* repo);
int git_attr_foreach(git_repository* repo, uint32_t flags, const(char)* path, int function(const(char)*, const(char)*, void*) callback, void* payload);
int git_attr_get(const(char)** value_out, git_repository* repo, uint32_t flags, const(char)* path, const(char)* name);
int git_attr_get_many(const(char)** values_out, git_repository* repo, uint32_t flags, const(char)* path, size_t num_attr, const(char)** names);
git_attr_t git_attr_value(const(char)* attr);