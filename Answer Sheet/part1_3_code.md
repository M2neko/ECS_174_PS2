```
variables:
    blobs: the set of the blobs.
    areas: the set of the areas of blobs.
    k: the number of groups
    clusters: the set of groups, each contains some blobs, size(clusters) = k.
    centroids: the list of means.

pseudo_code:
group_blobs(blobs,k)
    areas = get_areas(blobs,size(blobs))
    clusters = k_means(blobs,areas,k)
    return clusters
endfunc

get_areas(blobs,n)
    for blob = 1:n
        areas[blob] = 0
        for each pixel in blob
            areas[blob]++
        endfor
    endfor
    return areas
endfunc

k_means(blobs,areas,k)
    centriods = []
    cluster = zeros(k)
    cluster[each] = random blobs in the range
    // Loop until converge or fixed iterations
    while
        for i = 1:k
            centroids[i] = rand(min(areas),max(areas))
        endfor
        for each blob 
            // Use diff to determine
            find nearest centroid[]
            assign the blob to that cluster
        endfor
        for i = 1:k
            new centroid = mean of all blob to that cluster
        endfor
    endwhile
    return clusters
endfunc

```
