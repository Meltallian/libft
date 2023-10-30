#include "libft.h"

char	*ft_strndup(const char *src, size_t	len)
{
	char	*dup;
	size_t	i;
	size_t	src_len;

	src_len = ft_strlen(src);
	if (len > src_len) {
		len = src_len;
	}
	dup = (char *)malloc((ft_strlen(src) + 1) * sizeof(char));
	if (!dup)
		return (NULL);
	i = 0;
	while (src[i] && i < len)
	{
		dup[i] = src[i];
		i++;
	}
	dup[i] = '\0';
	return (dup);
}
