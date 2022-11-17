import ducc0.wgridder as ng
try:
    import wagg as wg
except ImportError as IE: # If no GPU is found, an ImportError is raised, which is OK. 
    pass
